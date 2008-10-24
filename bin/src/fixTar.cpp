// Sun-$Revision: 30.6 $

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

// This program fixes tar files for sitcom.




// ---------------------------------------------------------------------------
//		¥ InitializeManagers
// ---------------------------------------------------------------------------
//	Initialize the Toolbox managers

void InitializeManagers(void)

{
	MaxApplZone();
	
	InitGraf(&qd.thePort);
	InitFonts();
	FlushEvents(everyEvent, 0);
	InitWindows();
	InitMenus();
	TEInit();
	InitDialogs(nil);
	InitCursor();
}


main() {

  InitializeManagers();

  OSType types[]  = { 'UNKN' };
  StandardFileReply reply;
  StandardGetFile( 0, 1, types, &reply );
  if (!reply.sfGood)
    return 0;
  
  FInfo fndrInfo;
  OSErr anErr;
  anErr = HGetFInfo( reply.sfFile.vRefNum, reply.sfFile.parID, reply.sfFile.name, &fndrInfo );
  if (anErr)
  return 0;
  fndrInfo.fdType = '????';
  anErr = HSetFInfo( reply.sfFile.vRefNum, reply.sfFile.parID, reply.sfFile.name, &fndrInfo );
  if (anErr)
    return 0;
  return 0;
}
