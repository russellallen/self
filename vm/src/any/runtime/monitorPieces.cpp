/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "monitorPieces.hh"

# include "_monitorPieces.cpp.incl"



const int one_billion = 1000 * 1000 * 1000;


ProcessTime ProcessTime::operator-(const ProcessTime& t) {
  ProcessTime &tt= (ProcessTime&)t;
  ProcessTime res;
  if (tt.nano_secs() > nano_secs()) {
    res._secs      = secs()      - tt.secs() - 1;
    res._nano_secs = one_billion - tt.nano_secs() + nano_secs();
  } else {
    res._secs      = secs()      - tt.secs();
    res._nano_secs = nano_secs() - tt.nano_secs();
  }
  return res;
}


ProcessTime ProcessTime::operator+(const ProcessTime& t) {
  ProcessTime &tt= (ProcessTime&)t;
  ProcessTime res;
  res._secs      = secs()      + tt.secs();
  res._nano_secs = nano_secs() + tt.nano_secs();
  if (res.nano_secs() >= one_billion) {
    res._nano_secs -= one_billion;
    res._secs      += 1;
  }
  return res;
}




OSActivityMonitor::SystemState OSActivityMonitor::activity() {
  long inblock  = ProcessInfo::block_input_operations();
  long outblock = ProcessInfo::block_output_operations();
  ProcessInfo::update();
 
   inblock  = ProcessInfo:: block_input_operations() -  inblock;
  outblock  = ProcessInfo::block_output_operations() - outblock;

  if (inblock && outblock)    return disk_IO;
  if (inblock)                return disk_in;
  if (outblock)               return disk_out;
  if (processes->isIdle())    return idle;
  
  if ( MonitorCallsToVM::in_read_trap()   )   return reading;
  if ( MonitorCallsToVM::in_write_trap()  )   return writing;
  if ( MonitorCallsToVM::in_system_trap() )   return in_os;
                                              return nothing;
}


const char* OSActivityMonitor::state_string(OSActivityMonitor::SystemState s) {
  switch (s) {
   case disk_IO:  return " disk I/O ";
   case disk_in:  return " disk in ";
   case disk_out: return " disk out ";
   case idle:     return " idle ";
   case reading:  return " read ";
   case writing:  return " write ";
   case in_os:    return " OS ";
   default:       return "";
  }
};


fint LoadLevelMonitor::load_level = 100;

void LoadLevelMonitor::initialize() { 
  compute_load_level();
}

 

bool  ResourceAreaMonitor::is_consistent() { return resources.in_consistent_state(); }
int32 ResourceAreaMonitor::used()          { return resources.used(); }



Indicator::Indicator() {
  visible = false;
}


void Indicator::reposition(fint X, fint Y, fint W) {
  x = X; y = Y; w = W;
}


void Indicator::show(const char *text) {
  if (TheSpy->is_active()) {
    TheSpy->mw()->pw->draw_text(text, x, y+TheSpy->mw()->font_height()-3);
    visible = true;
  }
}


void Indicator::draw_under() {
  TheSpy->mw()->pw->clear_rectangle(x, y, w, TheSpy->ind_h());
}


void Indicator::hide() {
  if (TheSpy->is_active() && visible) {
    draw_under();
    visible = false;
  }
}


SharedIndicator::SharedIndicator()
                     : Indicator() {
  state = -1;
}


void SharedIndicator::show(const char *text, fint new_state) {
  if (state != new_state || !TheSpy->incremental) {
    if (visible) draw_under();
    Indicator::show(text);
    state = new_state;
  }
}


void SharedIndicator::hide() {
  Indicator::hide();
  state = -1;
}
  
ValueIndicator::ValueIndicator(const char* t, bool sum, fint d, fint n, fint off) {
  text = OS::strdup(t); showSum = sum; lastVal = -1; digits = d; offset = off;
  data = new SlidingAverage(n);
}


void ValueIndicator::printWithCommas( char* s, fint length, fint offset, int32 n) {
  // format n into s as "999,999" (length digits), right-justified at end-offset
  const char* digits = "0123456789";
  assert(n >= 0, "number must be positive");
  fint pos = strlen(s) - 1 - offset;
  assert(length <= pos, "string too short");
  fint i = 0;
  do {
    if (i == 3 || i == 6 || i == 9) s[pos--] = ',';
    s[pos--] = digits[n % 10];
    n = n / 10;
    ++i;
  } while (n && i < length);
  while (i < length) {
    if (i == 3 || i == 6 || i == 9) s[pos--] = ' ';
    s[pos--] = ' ';
    ++i;
  }
}


void ValueIndicator::update(int32 newVal, bool incremental) {
  data->add(newVal);
  int32 val = showSum ? data->sum() : data->average();
  if (val != lastVal || !incremental) {
    changed = true;
    printWithCommas(text, digits, offset, val);
    show();
    lastVal = val;
  } else {
    changed = false;
  }
}


void DifferenceIndicator::update(int32 newSum, bool incremental) {
  if (newSum < lastSum) lastSum = 0;      // sum was apparently reset
  ValueIndicator::update(newSum - lastSum, incremental);
  lastSum = newSum;
}


// ==============================================================
  
void CompileIndicator::show(const char *Name, const char* compiler, bool recompiling) {
  sprintf(name, "%s-%s%scompiling %-*.*s", compiler, 
          currentProcess->isUncommon() ? "unc-" : "", recompiling ? "re" : "",
          compile_len - 20, compile_len - 20, Name);
  Indicator::show(name);
}


void monitorBar_init() {}


MonitorBar::MonitorBar() {
  resize(0, 0, 0, 0);
  in_core_percentage_1 = in_core_percentage_2 = 100;
}


void MonitorBar::resize(fint X, fint Y, fint W, fint H) {
  x = X; y = Y; w = W; h = H; 
}    
  

void MonitorBar::init() { 
  old_len_1 = old_len_2 = -1; 
}


void MonitorBar::draw(bool incremental) {
  int32 len1 = min(w,        int32((float)used1() * w / capacity())); 
  int32 len2 = min(w - len1, int32((float)used2() * w / capacity())); 
  assert(len1 >= 0 && len2 >= 0 && len1  + len2 <= w, "wrong bar length");

  if (!incremental || len1 != old_len_1 || len2 != old_len_2) {
    if (w == 0) {
      TheSpy->mw()->pw->draw_line(x, y, x, y+h);
      return;
    }
    // draw lower part
    int32 blen = len1 * in_core_percentage_1 / 100;
  
    TheSpy->mw()->pw->set_color(TheSpy->mw()->pw->gray());
    TheSpy->mw()->pw->fill_rectangle(x, y+1, len1-blen, h-1);
    TheSpy->mw()->pw->set_color(TheSpy->mw()->pw->black());
    TheSpy->mw()->pw->fill_rectangle(x+len1-blen, y+1, blen, h-1);
    // draw empty part
    TheSpy->mw()->pw->clear_rectangle(x+len1, y+1, w-len1-len2, h-1);
    // draw upper part
    if (len2 != 0) {
      blen = len2 * in_core_percentage_2 / 100;
      fint glen = len2 - blen;
      TheSpy->mw()->pw->fill_rectangle(x+w-len2, y+1, blen, h-1);
      TheSpy->mw()->pw->set_color(TheSpy->mw()->pw->gray());
      TheSpy->mw()->pw->fill_rectangle(x+w-glen, y+1, glen, h-1);
      TheSpy->mw()->pw->set_color(TheSpy->mw()->pw->black());
    }
    // draw outline
    TheSpy->mw()->pw->draw_rectangle_black(x, y, w, h);
    old_len_1 = len1;
    old_len_2 = len2;
    draw_long_term(true);
    
  } else {
    draw_long_term(false);
  }
}      


void MonitorBar::calculateVMRegion(int32 startAddr, int32 size, 
                       fint& in_core_percentage, fint& oldlen) {
  int32 pagesize = OS::get_page_size();
  int32 start    = startAddr & ~(pagesize - 1);
  int32 end      = roundTo(startAddr + size, pagesize);
  int32 npages   = (end - start) / pagesize;
# define PSIZE 4096
  static char m[PSIZE]; // shouldn't use (m)alloc - in int handler!
  int32 incore   = 0;

  if (npages != 0) {
    int32 remaining = npages;
    while (start < end) {
      int32 len = end - start;  // len = size of area in bytes
      int32 n = remaining;              // n = size of area in pages
      if (len > PSIZE * pagesize) {
        len = PSIZE * pagesize;
        n   = PSIZE;
      }
      if (OS::min_core((caddr_t)start, len, m)) {
        perror("monitor: OS::min_core failed! ");
      } else {
        for (int32 i = 0; i < n; i++) {
          if (m[i] & 1) incore++;
        }
      }
      start  += len;
      remaining -= n;
    }
    fint percent = (100 * incore + npages / 2) / npages;
    if (in_core_percentage != percent) oldlen = -1;  // time to update
    in_core_percentage = percent;
  }
# undef PSIZE
}
  
  
void MonitorBar::calculate_VM_stats() {
  calculateVMRegion(int32(start1()), used1(), in_core_percentage_1, old_len_1);
  assert(in_core_percentage_1 >= 0 && in_core_percentage_1 <= 100,
         "wrong percentage");
  if (start2() != 0) {
    calculateVMRegion(int32(start2()), used2(), in_core_percentage_2, old_len_2);
    assert(in_core_percentage_2 >= 0 && in_core_percentage_2 <= 100,
           "wrong percentage");
  }
}


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  void MonitorCodeCacheBar::calculate_VM_stats() { /* no-op */ }
# endif


void MonitorCPUBar::init_CPU() {
  ProcessTime user_time   = ProcessInfo::user_time();
  ProcessTime system_time = ProcessInfo::system_time();

  secsU  = user_time.secs();
  usecsU = user_time.micro_secs();
  secsS  = system_time.secs();
  usecsS = system_time.micro_secs(); 
}


MonitorCPUBar::MonitorCPUBar(int32 usec)
: MonitorBar() { 
  interval_usec = usec; 
  interval_usecN = usec * n_intervals; 
  init();
}


void MonitorCPUBar::init() {
  sum_usecsU = usedU = sum_usecsS = usedS = n = 0;
  secsU = usecsU = secsS = secsS = 0;
  for(fint i=0; i < n_intervals; i++) used_usecsU[i] = used_usecsS[i] = 0;
}


int32 MonitorCPUBar::used1() {
  return (usedU + usedS) * LoadLevelMonitor::load_level / 100;
}


void MonitorCPUBar::calculate_VM_stats() {
  in_core_percentage_1 =
    (usedS + usedU) ? usedU * 100 / (usedS + usedU) : 100;
  if (in_core_percentage_1 < 0 || in_core_percentage_1 > 100) {
    warning1("cpuBar: in_core_percentage_1 is %ld", in_core_percentage_1);
    if (in_core_percentage_1 <   0) in_core_percentage_1 =   0;
    if (in_core_percentage_1 > 100) in_core_percentage_1 = 100;
  }
}


void MonitorCPUBar::update() {

  ProcessTime user_time   = ProcessInfo::user_time();
  ProcessTime system_time = ProcessInfo::system_time();

  // I believe it takes the differences here because we need the
  // additional time spend since last querying ProcessInfo
  int32 usecDiffU = user_time.micro_secs()   - usecsU;
  int32 usecDiffS = system_time.micro_secs() - usecsS;
  int32 secDiffU  = user_time.secs()   - secsU;
  int32 secDiffS  = system_time.secs() - secsS;
  
  used_usecsU[n]  = secDiffU * 1000000 + usecDiffU;
  used_usecsS[n]  = secDiffS * 1000000 + usecDiffS;
  assert(used_usecsU[n] >= 0 && used_usecsS[n] >= 0, "negative CPU usage");

  usecsU = user_time.micro_secs();
  usecsS = system_time.micro_secs();
  secsU  = user_time.secs();
  secsS  = system_time.secs();
  
  fint nextn = n == n_intervals - 1 ? 0 : n + 1;
  sum_usecsU += used_usecsU[n] - used_usecsU[nextn];
  sum_usecsS += used_usecsS[n] - used_usecsS[nextn];
  n = nextn;
  assert(interval_usecN % 100 == 0, "should be divisible by 100");
  usedU = sum_usecsU / (interval_usecN / 100);
  usedS = sum_usecsS / (interval_usecN / 100);
  calculate_VM_stats();
  // The correction below is needed because of lost timer interrupts.
  if (usedU > 100) usedU = 100; 
  if (usedS + usedU > 100) usedS = 100 - usedU;
  assert(usedU >= 0 && usedS >= 0, "negative CPU usage");
}


void MonitorMemBar::resize(fint X, fint Y, fint H, fint factor) {
  MonitorBar::resize(X, Y, int(capacity()/(((SelfMonitor*)TheSpy)->bytes_per_pixel() * factor)), H*factor); 
}


MonitorSampledBar::MonitorSampledBar() { 
  init();
}


void MonitorSampledBar::init() {
  sum1 = sum2 = sum3 = sum4 = n = 0;
  sum1T = sum2T = sum3T = sum4T = elapsedT = 0;
  for(fint i=0; i < n_samples; i++) 
    samples1[i] = samples2[i] = samples3[i] = samples4[i] = ticks[i] = 0;
  elapsed_ticks = 0;
  old_lta1 = old_lta2 = old_lta3 = old_lta4 = 0;
}


void MonitorSampledBar::calculate_VM_stats() {
  in_core_percentage_1 =  (sum1 + sum2) ? sum1 * 100 / (sum1 + sum2) : 100;
  in_core_percentage_2 =  (sum3 + sum4) ? sum3 * 100 / (sum3 + sum4) : 100;
    
  assert(in_core_percentage_1 >= 0 && in_core_percentage_1 <= 100,
         "wrong percentage");
}


void MonitorSampledBar::update0() {
  for(fint i=0; i < n_samples; i++) 
    samples1[i] = samples2[i] = samples3[i] = samples4[i] = ticks[i] = 0;
  sum1 = sum2 = sum3 = sum4 = elapsed_ticks = 0;
  calculate_VM_stats();
}


void MonitorSampledBar::update(fint count1, fint count2, fint et) {
  update(count1, count2, 0, 0, et);
}


void MonitorSampledBar::update(fint count1, 
                            fint count2, 
                            fint count3, 
                            fint count4,
                            fint et) {
  fint nextn = n == n_samples - 1 ? 0 : n + 1;
  sum1 += count1 - samples1[nextn]; samples1[nextn] = count1;
  sum2 += count2 - samples2[nextn]; samples2[nextn] = count2;
  sum3 += count3 - samples3[nextn]; samples3[nextn] = count3;
  sum4 += count4 - samples4[nextn]; samples4[nextn] = count4;
    
  sum1T += count1; sum2T += count2; sum3T += count3; sum4T += count4;
  elapsedT += et;
  elapsed_ticks += et - ticks[nextn]; ticks[nextn] = et;
  n = nextn;
  calculate_VM_stats();
}


int32 MonitorSampledBar::used1() {
  int32 u = sum1 + sum2;
  int32 c = capacity();
  // this can exceed capacity slightly due to sampling errors
  if (u > 2*c)
    warning2("MonitorSampledBar: usage(1) is way too high: %ld >> %ld", u, c);
  return u <= c ? u : c;
}


int32 MonitorSampledBar::used2() {
  int32 u = sum3 + sum4;
  int32 c = capacity();
  // this can exceed capacity slightly due to sampling errors
  if (u > 2*c)
    warning2("MonitorSampledBar: usage(2) is way too high: %ld >> %ld", u, c);
  return u <= c ? u : c;
}


void MonitorSampledBar::draw_long_term(bool mustDraw) {
  if (!SpyShowLongTerm) return;

  // calculate long-term average (use floats to avoid overflow)
  if (elapsedT == 0) return;
  fint lta1 = fint((w-2) * ((float)sum1T / elapsedT) + 1);
  fint lta2 = fint((w-2) * ((float)sum2T / elapsedT) + 1);
  fint lta3 = fint((w-2) * ((float)sum3T / elapsedT) + 1);
  fint lta4 = fint((w-2) * ((float)sum4T / elapsedT) + 1);

  const fint markerH = 3;
  fint ys = y + (h - markerH) / 2;
  TheSpy->mw()->pw->set_xor();
  if (mustDraw || lta1 != old_lta1) {
    if (!mustDraw) TheSpy->mw()->pw->draw_line(x+old_lta1, ys, x+old_lta1, ys+markerH);
    TheSpy->mw()->pw->draw_line(x + lta1, ys, x + lta1, ys+markerH);
    old_lta1 = lta1;
  }
  // draw 2nd bar only if not at left end, and if not at same position as 1st
  if (mustDraw || lta2 != old_lta2) {
    if (!mustDraw && old_lta2 != 1)
      TheSpy->mw()->pw->draw_line(x+old_lta2, ys, x+old_lta2, ys+markerH);
    if (lta2 != 1 && lta2 != lta1)
      TheSpy->mw()->pw->draw_line(x + lta2, ys, x + lta2, ys+markerH);
    old_lta2 = lta2;
  }
  if (mustDraw || lta3 != old_lta3) {
    if (!mustDraw && old_lta3 != 1)
      TheSpy->mw()->pw->draw_line(x+old_lta3, ys, x+old_lta3, ys+markerH);
    if (lta3 != 1 && lta3 != lta2 && lta3 != lta1)
      TheSpy->mw()->pw->draw_line(x + lta3, ys, x + lta3, ys+markerH);
    old_lta3 = lta3;
  }
  if (mustDraw || lta4 != old_lta4) {
    if (!mustDraw && old_lta4 != 1)
      TheSpy->mw()->pw->draw_line(x+old_lta4, ys, x+old_lta4, ys+markerH);
    if (lta4 != 1 && lta4 != lta3 && lta4 != lta2 && lta4 != lta1)
      TheSpy->mw()->pw->draw_line(x + lta4, ys, x + lta4, ys+markerH);
    old_lta4 = lta4;
  }
  TheSpy->mw()->pw->set_copy();
}


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

  void MonitorZoneBar::resize(fint X, fint Y, fint H, fint factor,
                                Heap *newZ) {
    if (newZ) z= newZ;
    MonitorBar::resize(X, Y, int(capacity()/(((SelfMonitor*)TheSpy)->bytes_per_pixel() * factor)), H*factor); 
  }
    
# endif
