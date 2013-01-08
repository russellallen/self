'Sun-$Revision: 30.6 $'
 
"Copyright 1992-2012 AUTHORS.
 See the LICENSE file for license information."
 
"CAUTION: This file is not part of the documented Self world.  It may be
 be changed or removed at any time, and it will not be documented.
 
 This file can be removed without affecting the Self world in any way.
"
  "Template used by primitiveMaker to create xgl primitives."
 
primitiveMaker reader copy dynamicLinking create: 'xgl' From: '
 
    -- Copyright 1992-2012 AUTHORS.
    -- See the LICENSE file for license information.
 
    macroName:          xgl
    glueLibraryName:    xgl_glue.so


traits: traits xgl raw systemState
  -- creation and deletion messages
  visibility: publicSlot
   void	open = Xgl_sys_state_obj {xgl systemState deadCopy} call xgl_open_no_args
   void openWithAttribute:  any Xgl_attribute 				\
	        AttrValue:  any int					\
     		     Zero:  unsigned_int 				\
	= Xgl_sys_state_obj {xgl systemState deadCopy} call xgl_open
   Xgl_sys_state_obj close = void call xgl_close

  -- inquiry message
  visibility: publicSlot
   Xgl_sys_state_obj inquireHardware:  Xgl_obj_desc			\
	= Xgl_inquire {xgl inquire deadCopy} call xgl_inquire

  -- other object creation messages
  visibility: publicSlot
   Xgl_sys_state_obj createXglObject:  any Xgl_obj_type 		\
	                  ObjectDesc:  proxy_null Xgl_obj_desc* Xgl_obj_desc_seal	\
				Zero:  unsigned_int 			\
	= Xgl_object_obj {xgl genericObject deadCopy} call xgl_object_create
   Xgl_sys_state_obj createXglObject:  any Xgl_obj_type 		\
       	                  ObjectDesc:  proxy_null Xgl_obj_desc* Xgl_obj_desc_seal	\
		       WithAttribute:  any Xgl_attribute		\
		           AttrValue:  any int				\
			        Zero:  unsigned_int 			\
	= Xgl_object_obj {xgl genericObject deadCopy} call xgl_object_create


traits: traits xgl raw genericObject
  -- creation/deletion message
  visibility: publicSlot
   void newAsVector: unsigned_int 					\
	= Xgl_object { xgl genericObject deadCopy} call xgl_object_new
   Xgl_object deleteVector: unsigned_int = void call xgl_object_delete 
   Xgl_object_obj delete = void call xgl_object_destroy

  -- vector-ish messages
  visibility: publicSlot
   Xgl_object at: unsigned_int 					\
	= Xgl_object_obj {xgl genericObject deadCopy} call xgl_object_at
   Xgl_object at: unsigned_int Put: Xgl_object_obj 			\
	= void call xgl_object_at_put
 
  -- get and set attributes of this object
  visibility: publicSlot
   Xgl_object_obj setAttribute:  any Xgl_attribute			\
		     AttrValue:  any int				\
			  Zero:  unsigned_int				\
	= void call xgl_object_set
   Xgl_object_obj getAttribute:  any Xgl_attribute			\
		     AttrValue:  any void*				\
	= void call xgl_object_get

  -- ctx operations
  visibility: publicSlot
   Xgl_object_obj ctxNewFrame = void call xgl_context_new_frame
   Xgl_object_obj ctxPost: bool = void call xgl_context_post
   Xgl_object_obj ctxCopyRaster:  Xgl_bounds_i2d			\
		      	    Pos:  Xgl_pt_i2d			  	\
		      SrcRaster:  Xgl_object_obj			\
	= void call xgl_context_copy_raster
   Xgl_object_obj ctxCopyBuffer:  Xgl_bounds_i2d			\
			    Pos:  Xgl_pt_i2d				\
		      SrcRaster:  Xgl_object_obj			\
	= void call xgl_context_copy_buffer
   Xgl_object_obj ctxAccumulate:  Xgl_bounds_i2d			\
		     	    Pos:  Xgl_pt_i2d				\
		      SrcWeight:  float					\
		    AccumWeight:  float					\
		         Buffer:  any Xgl_buffer_sel			\
	= void call xgl_context_accumulate
   Xgl_object_obj ctxClearAccumulation:  Xgl_color 			\
	= void call xgl_context_clear_accumulation
   Xgl_object_obj ctxDisplayGcache:  Xgl_object_obj			\
			      Test:  bool				\
			   Display:  bool				\
	= any Xgl_cache_display call xgl_context_display_gcache
   Xgl_object_obj ctxGetPixel:  Xgl_pt_i2d				\
		  ResultColor:  Xgl_color				\
	= bool call xgl_context_get_pixel
   Xgl_object_obj ctxPop = void call xgl_context_pop
   Xgl_object_obj ctxPush: any Xgl_attribute* = void call xgl_context_push
   Xgl_object_obj ctxSetMultiPixel:  unsigned_int			\
			 Positions:  Xgl_pt_i2d				\
			    Colors:  Xgl_color				\
	= void call xgl_context_set_multi_pixel
   Xgl_object_obj ctxSetPixel:  Xgl_pt_i2d				\
			Color:  Xgl_color				\
	= void call xgl_context_set_pixel
   Xgl_object_obj ctxSetPixelRow:  unsigned_int				\
			     Row:  unsigned_int				\
			   Count:  unsigned_int				\
			   Color:  Xgl_color				\
	= void call xgl_context_set_pixel_row
   Xgl_object_obj ctxUpdateModelTransform:  any Xgl_model_trans_request	\
	= void call xgl_context_update_model_trans
   Xgl_object_obj ctxCheckBoundingBox:  any Xgl_primitive_type		\
		          BoundingBox:  Xgl_bbox			\
			   GeomStatus:  any Xgl_geom_status*		\
	= void call xgl_context_check_bbox
   Xgl_object_obj ctxFlush: any Xgl_flush_action = void call xgl_context_flush
   Xgl_object_obj ctxPickClear = void call xgl_pick_clear
   Xgl_object_obj ctxPickGetIdentifiers:  any long*			\
		       	       PickInfo:  Xgl_pick_info 		\
	= void call xgl_pick_get_identifiers

  -- ctx primitive drawing operations
  visibility: publicSlot
   Xgl_object_obj multiPolyline:  Xgl_bbox				\
	      		  Count:  unsigned_int				\
		         Points:  Xgl_pt_list				\
	= void call xgl_multipolyline
   Xgl_object_obj strokeText:  any void*				\
			 Pos:  proxy void* ANY_SEAL			\
			 Dir:  proxy void* ANY_SEAL			\
	= void call xgl_stroke_text
   Xgl_object_obj polygon:  any Xgl_facet_type				\
	            Facet:  Xgl_facet					\
	      BoundingBox:  Xgl_bbox					\
	    NumPointLists:  unsigned_int				\
	       PointLists:  Xgl_pt_list					\
	= void call xgl_polygon
   Xgl_object_obj multiSimplePolygon:  any Xgl_facet_flags		\
		              Facets:  Xgl_facet_list			\
	                 BoundingBox:  Xgl_bbox				\
   		       NumPointLists:  unsigned_int			\
		      	  PointLists:  Xgl_pt_list			\
	= void call xgl_multi_simple_polygon
   Xgl_object_obj multiMarker: Xgl_pt_list = void call xgl_multimarker
   Xgl_object_obj triangleStrip:  Xgl_facet_list			\
			 Points:  Xgl_pt_list				\
	= void call xgl_triangle_strip
   Xgl_object_obj triangleList:  Xgl_facet_list				\
			Points:  Xgl_pt_list				\
	       	         Flags:  any Xgl_tlist_flags			\
	= void call xgl_triangle_list
   Xgl_object_obj quadrilateralMesh:  unsigned_int			\
			    Columns:  unsigned_int			\
		             Facets:  Xgl_facet_list			\
		      	     Points:  Xgl_pt_list			\
	= void call xgl_quadrilateral_mesh
   Xgl_object_obj multiRectangle: Xgl_rect_list = void call xgl_multirectangle
   Xgl_object_obj multiCircle: Xgl_circle_list = void call xgl_multicircle
   Xgl_object_obj annotationText:  any void* 				\
			     Pos:  proxy void* ANY_SEAL			\
		             Dir:  proxy void* ANY_SEAL			\
	= void call xgl_annotation_text
   Xgl_object_obj imageAtPos:  proxy void* ANY_SEAL			\
		      Bounds:  Xgl_bounds_i2d				\
	           SrcRaster:  Xgl_object_obj				\
	= void call xgl_image
   Xgl_object_obj multiEllipticalArc: Xgl_ell_list 			\
	= void call xgl_multi_elliptical_arc
   Xgl_object_obj multiArc:  Xgl_arc_list = void call xgl_multiarc
   Xgl_object_obj nubSplineCurve:  Xgl_nu_bspline_curve			\
	= void call xgl_nu_bspline_curve
   Xgl_object_obj strokeTextExtent:  proxy void* ANY_SEAL		\
			    Bounds:  Xgl_bounds_f2d			\
		             Point:  Xgl_pt_f2d				\
	= void call xgl_stroke_text_extent
   Xgl_object_obj nurbSplineCurve:  Xgl_nurbs_curve			\
			    Range:  proxy_null Xgl_bounds_f1d* Xgl_bounds_f1d_seal			\
		      ColorSpline:  proxy_null Xgl_curve_color_spline* Xgl_curve_color_spline_seal	\
	= void call xgl_nurbs_curve
   Xgl_object_obj nurbSplineSurface:  Xgl_nurbs_surf			\
			   Trimming:  Xgl_trim_loop_list		\
		          GeomHints:  proxy_null Xgl_nurbs_surf_simple_geom* Xgl_nurbs_surf_simple_geom_seal	\
		        ColorSpline:  proxy_null Xgl_surf_color_spline* Xgl_surf_color_spline_seal		\
			DataSplines:  proxy_null Xgl_surf_data_spline_list* Xgl_surf_data_spline_list_seal	\
	= void call xgl_nurbs_surface

  -- window raster operators
  visibility: publicSlot
   Xgl_object_obj winRasResize = void call xgl_window_raster_resize

  -- transform operations
  visibility: publicSlot
   Xgl_object_obj transformCopy: Xgl_object_obj = void call xgl_transform_copy
   Xgl_object_obj transformIdentity = void call xgl_transform_identity
   Xgl_object_obj transformInvert:  Xgl_object_obj               	\
        = proxy_null Xgl_object_obj* Xgl_object_obj_seal {xgl genericObject deadCopy} \
          call xgl_transform_invert
   Xgl_object_obj transformMultiply:  Xgl_object_obj              	\
                                 By:  Xgl_object_obj              	\
        = void call xgl_transform_multiply
   Xgl_object_obj transformPoint:  Xgl_pt = void call xgl_transform_point
   Xgl_object_obj transformPointList:  Xgl_pt_list                	\
                                Dest:  proxy void* ANY_SEAL       	\
        = void call xgl_transform_point_list
   Xgl_object_obj transformRead:  proxy void* ANY_SEAL           	\
        = void call xgl_transform_read
   Xgl_object_obj transformRotate:  double                       	\
                             Axis:  any Xgl_axis                  	\
                           Update:  any Xgl_trans_update          	\
        = void call xgl_transform_rotate
   Xgl_object_obj transformScale:  Xgl_pt                        	\
                          Update:  any Xgl_trans_update           	\
        = void call xgl_transform_scale
   Xgl_object_obj transformTranslate:  Xgl_pt                     	\
                              Update:  any Xgl_trans_update       	\
        = void call xgl_transform_translate
   Xgl_object_obj transformTranspose:  Xgl_object_obj            	\
        = void call xgl_transform_transpose
   Xgl_object_obj transformWrite:  proxy void* ANY_SEAL		        \
        = void call xgl_transform_write
   Xgl_object_obj transformWriteSpecific:  proxy void* ANY_SEAL  	\
                                  Member:  any Xgl_trans_member   	\
        = void call xgl_transform_write_specific

  -- light operations
  visibility: publicSlot
   Xgl_object_obj lightCopy: Xgl_object_obj = void call xgl_light_copy

  -- gcache operations
  visibility: publicSlot
   Xgl_object_obj gcacheMultiEllipticalArc:  Xgl_object_obj		\
                  	              Arcs:  Xgl_ell_list		\
        = void call xgl_gcache_multi_elliptical_arc
   Xgl_object_obj gcacheMultiSimplePolygon:  Xgl_object_obj		\
				FacetFlags:  any Xgl_facet_flags	\
			            Facets:  Xgl_facet_list    		\
			       BoundingBox:  Xgl_bbox			\
			     NumPointLists:  unsigned_long		\
			        PointLists:  Xgl_pt_list		\
        = void call xgl_gcache_multi_simple_polygon
   Xgl_object_obj gcacheMultimarker:  Xgl_object_obj			\
			     Points:  Xgl_pt_list			\
        = void call xgl_gcache_multimarker
   Xgl_object_obj gcacheMultipolyline:  Xgl_object_obj			\
		          BoundingBox:  Xgl_bbox			\
		        NumPointLists:  unsigned_long			\
		           PointLists:  Xgl_pt_list			\
        = void call xgl_gcache_multipolyline
   Xgl_object_obj gcacheNUBSplineCurve:  Xgl_object_obj			\
			         Curve:  Xgl_nu_bspline_curve		\
        = void call xgl_gcache_nu_bspline_curve
   Xgl_object_obj gcacheNurbsCurve:  Xgl_object_obj			\
			     Curve:  Xgl_nurbs_curve			\
			     Range:  proxy_null Xgl_bounds_f1d* Xgl_bounds_f1d_seal 			\
		       ColorSpline:  proxy_null Xgl_curve_color_spline* Xgl_curve_color_spline_seal  	\
        = void call xgl_gcache_nurbs_curve
   Xgl_object_obj gcacheNurbsSurface:  Xgl_object_obj			\
			     Surface:  Xgl_nurbs_surf			\
			    Trimming:  Xgl_trim_loop_list		\
			       Hints:  proxy_null Xgl_nurbs_surf_simple_geom* Xgl_nurbs_surf_simple_geom_seal 	\
		         ColorSpline:  proxy_null Xgl_surf_color_spline* Xgl_surf_color_spline_seal		\
		         DataSplines:  proxy_null Xgl_surf_data_spline_list* Xgl_surf_data_spline_list_seal	\
        = void call xgl_gcache_nurbs_surface
   Xgl_object_obj gcachePolygon:  Xgl_object_obj			\
	      	      FacetType:  any Xgl_facet_type			\
		         Facets:  Xgl_facet				\
		    BoundingBox:  Xgl_bbox				\
	          NumPointLists:  unsigned_long				\
	             PointLists:  Xgl_pt_list				\
        = void call xgl_gcache_polygon
   Xgl_object_obj gcacheStrokeText:  Xgl_object_obj			\
			    String:  any void*				\
			       Pos:  proxy void* ANY_SEAL		\
			       Dir:  proxy void* ANY_SEAL		\
        = void call xgl_gcache_stroke_text
   Xgl_object_obj gcacheTriangleStrip:  Xgl_object_obj			\
			       Facets:  Xgl_facet_list    		\
			       Points:  Xgl_pt_list			\
        = void call xgl_gcache_triangle_strip
   Xgl_object_obj gcacheAnnotationText:  Xgl_object_obj			\
			        String:  any void* 			\
		       	           Pos:  proxy void* ANY_SEAL		\
			           Dir:  proxy void* ANY_SEAL		\
        = void call xgl_gcache_annotation_text
   Xgl_object_obj gcacheMultiarc:  Xgl_object_obj			\
			    Arcs:  Xgl_arc_list				\
        = void call xgl_gcache_multiarc
   Xgl_object_obj gcacheMulticircle:  Xgl_object_obj			\
			    Circles:  Xgl_circle_list			\
        = void call xgl_gcache_multicircle
   Xgl_object_obj	gcacheMultirectangle:  Xgl_object_obj		\
				  Rectangles:  Xgl_rect_list		\
        = void call xgl_gcache_multirectangle
   Xgl_object_obj gcacheQuadrilateralMesh:  Xgl_object_obj		\
			    	     Rows:  unsigned_long		\
				  Columns:  unsigned_long		\
				   Facets:  Xgl_facet_list		\
				   Points:  Xgl_pt_list			\
        = void call xgl_gcache_quadrilateral_mesh
   Xgl_object_obj gcacheTriangleList:  Xgl_object_obj			\
			      Facets:  Xgl_facet_list			\
			      Points:  Xgl_pt_list			\
			       Flags:  any Xgl_tlist_flags		\
        = void call xgl_gcache_triangle_list
   Xgl_object_obj gcacheImage:  Xgl_object_obj				\
			  Pos:  proxy void* ANY_SEAL			\
		  BoundingBox:  Xgl_bounds_i2d				\
		    SrcRaster:  Xgl_object_obj				\
        = void call xgl_gcache_image

  -- texture operators
  visibility: publicSlot
   Xgl_object_obj mipmapTextureBuild:  Xgl_object_obj			\
		             Ubounds:  any Xgl_texture_boundary		\
		       	     Vbounds:  any Xgl_texture_boundary		\
	= void call xgl_mipmap_texture_build

','

traits: traits xgl raw xWindow
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_X_window {xgl xWindow deadCopy} call xgl_x_window_new
   Xgl_X_window delete = void call xgl_x_window_delete

  -- create nil proxy
  visibility: publicSlot
   void nilXWindow = proxy_null Xgl_X_window* Xgl_X_window_seal {xgl xWindow deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_X_window at: unsigned_int = proxy_null Xgl_X_window* Xgl_X_window_seal {xgl xWindow deadCopy} call xgl_x_window_at
   Xgl_X_window at: unsigned_int Put: Xgl_X_window = void call xgl_x_window_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_X_window x_display = proxy void* Display_seal {xlib display deadCopy} getMember X_display
   Xgl_X_window x_display: proxy void* Display_seal = void setMember X_display

   Xgl_X_window x_screen = int getMember X_screen
   Xgl_X_window x_screen: int = void setMember X_screen

   Xgl_X_window x_window = proxy Window Window_seal {xlib window deadCopy} getMember X_window
   Xgl_X_window x_window: proxy Window ANY_SEAL = void setMember X_window

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_X_window set_X_display: proxy void* Display_seal \
	X_screen: int \
	X_window: proxy Window ANY_SEAL \
	 = void call xgl_x_window_set


traits: traits xgl raw arcAd3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_arc_ad3d {xgl arcAd3d deadCopy} call xgl_arc_ad3d_new
   Xgl_arc_ad3d delete = void call xgl_arc_ad3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilArcAd3d = proxy_null Xgl_arc_ad3d* Xgl_arc_ad3d_seal {xgl arcAd3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_arc_ad3d at: unsigned_int = proxy_null Xgl_arc_ad3d* Xgl_arc_ad3d_seal {xgl arcAd3d deadCopy} call xgl_arc_ad3d_at
   Xgl_arc_ad3d at: unsigned_int Put: Xgl_arc_ad3d = void call xgl_arc_ad3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_arc_ad3d center = Xgl_pt_flag_d3d {xgl ptFlagD3d deadCopy} call xgl_arc_ad3d_center
   Xgl_arc_ad3d center: Xgl_pt_flag_d3d = void call xgl_arc_ad3d_center

   Xgl_arc_ad3d radius = double getMember radius
   Xgl_arc_ad3d radius: double = void setMember radius

   Xgl_arc_ad3d start_angle = double getMember start_angle
   Xgl_arc_ad3d start_angle: double = void setMember start_angle

   Xgl_arc_ad3d stop_angle = double getMember stop_angle
   Xgl_arc_ad3d stop_angle: double = void setMember stop_angle

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_arc_ad3d set_Center: Xgl_pt_flag_d3d \
	Radius: double \
	Start_angle: double \
	Stop_angle: double \
	 = void call xgl_arc_ad3d_set


traits: traits xgl raw arcAf3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_arc_af3d {xgl arcAf3d deadCopy} call xgl_arc_af3d_new
   Xgl_arc_af3d delete = void call xgl_arc_af3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilArcAf3d = proxy_null Xgl_arc_af3d* Xgl_arc_af3d_seal {xgl arcAf3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_arc_af3d at: unsigned_int = proxy_null Xgl_arc_af3d* Xgl_arc_af3d_seal {xgl arcAf3d deadCopy} call xgl_arc_af3d_at
   Xgl_arc_af3d at: unsigned_int Put: Xgl_arc_af3d = void call xgl_arc_af3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_arc_af3d center = Xgl_pt_flag_f3d {xgl ptFlagF3d deadCopy} call xgl_arc_af3d_center
   Xgl_arc_af3d center: Xgl_pt_flag_f3d = void call xgl_arc_af3d_center

   Xgl_arc_af3d radius = float getMember radius
   Xgl_arc_af3d radius: float = void setMember radius

   Xgl_arc_af3d start_angle = float getMember start_angle
   Xgl_arc_af3d start_angle: float = void setMember start_angle

   Xgl_arc_af3d stop_angle = float getMember stop_angle
   Xgl_arc_af3d stop_angle: float = void setMember stop_angle

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_arc_af3d set_Center: Xgl_pt_flag_f3d \
	Radius: float \
	Start_angle: float \
	Stop_angle: float \
	 = void call xgl_arc_af3d_set


traits: traits xgl raw arcD2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_arc_d2d {xgl arcD2d deadCopy} call xgl_arc_d2d_new
   Xgl_arc_d2d delete = void call xgl_arc_d2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilArcD2d = proxy_null Xgl_arc_d2d* Xgl_arc_d2d_seal {xgl arcD2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_arc_d2d at: unsigned_int = proxy_null Xgl_arc_d2d* Xgl_arc_d2d_seal {xgl arcD2d deadCopy} call xgl_arc_d2d_at
   Xgl_arc_d2d at: unsigned_int Put: Xgl_arc_d2d = void call xgl_arc_d2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_arc_d2d center = Xgl_pt_flag_d2d {xgl ptFlagD2d deadCopy} call xgl_arc_d2d_center
   Xgl_arc_d2d center: Xgl_pt_flag_d2d = void call xgl_arc_d2d_center

   Xgl_arc_d2d radius = double getMember radius
   Xgl_arc_d2d radius: double = void setMember radius

   Xgl_arc_d2d start_angle = double getMember start_angle
   Xgl_arc_d2d start_angle: double = void setMember start_angle

   Xgl_arc_d2d stop_angle = double getMember stop_angle
   Xgl_arc_d2d stop_angle: double = void setMember stop_angle

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_arc_d2d set_Center: Xgl_pt_flag_d2d \
	Radius: double \
	Start_angle: double \
	Stop_angle: double \
	 = void call xgl_arc_d2d_set


traits: traits xgl raw arcD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_arc_d3d {xgl arcD3d deadCopy} call xgl_arc_d3d_new
   Xgl_arc_d3d delete = void call xgl_arc_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilArcD3d = proxy_null Xgl_arc_d3d* Xgl_arc_d3d_seal {xgl arcD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_arc_d3d at: unsigned_int = proxy_null Xgl_arc_d3d* Xgl_arc_d3d_seal {xgl arcD3d deadCopy} call xgl_arc_d3d_at
   Xgl_arc_d3d at: unsigned_int Put: Xgl_arc_d3d = void call xgl_arc_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_arc_d3d center = Xgl_pt_flag_d3d {xgl ptFlagD3d deadCopy} call xgl_arc_d3d_center
   Xgl_arc_d3d center: Xgl_pt_flag_d3d = void call xgl_arc_d3d_center

   Xgl_arc_d3d dir = Xgl_pt_d3d {xgl ptD3d deadCopy} call xgl_arc_d3d_dir

   Xgl_arc_d3d dir_normal = bool getMember dir_normal
   Xgl_arc_d3d dir_normal: bool = void setMember dir_normal

   Xgl_arc_d3d dir_normalized = bool getMember dir_normalized
   Xgl_arc_d3d dir_normalized: bool = void setMember dir_normalized

   Xgl_arc_d3d radius = double getMember radius
   Xgl_arc_d3d radius: double = void setMember radius

   Xgl_arc_d3d start_angle = double getMember start_angle
   Xgl_arc_d3d start_angle: double = void setMember start_angle

   Xgl_arc_d3d stop_angle = double getMember stop_angle
   Xgl_arc_d3d stop_angle: double = void setMember stop_angle

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_arc_d3d set_Center: Xgl_pt_flag_d3d \
	Dir_normal: bool \
	Dir_normalized: bool \
	Radius: double \
	Start_angle: double \
	Stop_angle: double \
	 = void call xgl_arc_d3d_set


traits: traits xgl raw arcF2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_arc_f2d {xgl arcF2d deadCopy} call xgl_arc_f2d_new
   Xgl_arc_f2d delete = void call xgl_arc_f2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilArcF2d = proxy_null Xgl_arc_f2d* Xgl_arc_f2d_seal {xgl arcF2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_arc_f2d at: unsigned_int = proxy_null Xgl_arc_f2d* Xgl_arc_f2d_seal {xgl arcF2d deadCopy} call xgl_arc_f2d_at
   Xgl_arc_f2d at: unsigned_int Put: Xgl_arc_f2d = void call xgl_arc_f2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_arc_f2d center = Xgl_pt_flag_f2d {xgl ptFlagF2d deadCopy} call xgl_arc_f2d_center
   Xgl_arc_f2d center: Xgl_pt_flag_f2d = void call xgl_arc_f2d_center

   Xgl_arc_f2d radius = float getMember radius
   Xgl_arc_f2d radius: float = void setMember radius

   Xgl_arc_f2d start_angle = float getMember start_angle
   Xgl_arc_f2d start_angle: float = void setMember start_angle

   Xgl_arc_f2d stop_angle = float getMember stop_angle
   Xgl_arc_f2d stop_angle: float = void setMember stop_angle

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_arc_f2d set_Center: Xgl_pt_flag_f2d \
	Radius: float \
	Start_angle: float \
	Stop_angle: float \
	 = void call xgl_arc_f2d_set


traits: traits xgl raw arcF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_arc_f3d {xgl arcF3d deadCopy} call xgl_arc_f3d_new
   Xgl_arc_f3d delete = void call xgl_arc_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilArcF3d = proxy_null Xgl_arc_f3d* Xgl_arc_f3d_seal {xgl arcF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_arc_f3d at: unsigned_int = proxy_null Xgl_arc_f3d* Xgl_arc_f3d_seal {xgl arcF3d deadCopy} call xgl_arc_f3d_at
   Xgl_arc_f3d at: unsigned_int Put: Xgl_arc_f3d = void call xgl_arc_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_arc_f3d center = Xgl_pt_flag_f3d {xgl ptFlagF3d deadCopy} call xgl_arc_f3d_center
   Xgl_arc_f3d center: Xgl_pt_flag_f3d = void call xgl_arc_f3d_center

   Xgl_arc_f3d dir = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_arc_f3d_dir

   Xgl_arc_f3d dir_normal = bool getMember dir_normal
   Xgl_arc_f3d dir_normal: bool = void setMember dir_normal

   Xgl_arc_f3d dir_normalized = bool getMember dir_normalized
   Xgl_arc_f3d dir_normalized: bool = void setMember dir_normalized

   Xgl_arc_f3d radius = float getMember radius
   Xgl_arc_f3d radius: float = void setMember radius

   Xgl_arc_f3d start_angle = float getMember start_angle
   Xgl_arc_f3d start_angle: float = void setMember start_angle

   Xgl_arc_f3d stop_angle = float getMember stop_angle
   Xgl_arc_f3d stop_angle: float = void setMember stop_angle

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_arc_f3d set_Center: Xgl_pt_flag_f3d \
	Dir_normal: bool \
	Dir_normalized: bool \
	Radius: float \
	Start_angle: float \
	Stop_angle: float \
	 = void call xgl_arc_f3d_set


traits: traits xgl raw arcI2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_arc_i2d {xgl arcI2d deadCopy} call xgl_arc_i2d_new
   Xgl_arc_i2d delete = void call xgl_arc_i2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilArcI2d = proxy_null Xgl_arc_i2d* Xgl_arc_i2d_seal {xgl arcI2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_arc_i2d at: unsigned_int = proxy_null Xgl_arc_i2d* Xgl_arc_i2d_seal {xgl arcI2d deadCopy} call xgl_arc_i2d_at
   Xgl_arc_i2d at: unsigned_int Put: Xgl_arc_i2d = void call xgl_arc_i2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_arc_i2d center = Xgl_pt_flag_i2d {xgl ptFlagI2d deadCopy} call xgl_arc_i2d_center
   Xgl_arc_i2d center: Xgl_pt_flag_i2d = void call xgl_arc_i2d_center

   Xgl_arc_i2d radius = unsigned_long getMember radius
   Xgl_arc_i2d radius: unsigned_long = void setMember radius

   Xgl_arc_i2d start_angle = float getMember start_angle
   Xgl_arc_i2d start_angle: float = void setMember start_angle

   Xgl_arc_i2d stop_angle = float getMember stop_angle
   Xgl_arc_i2d stop_angle: float = void setMember stop_angle

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_arc_i2d set_Center: Xgl_pt_flag_i2d \
	Radius: unsigned_long \
	Start_angle: float \
	Stop_angle: float \
	 = void call xgl_arc_i2d_set


traits: traits xgl raw arcList
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_arc_list {xgl arcList deadCopy} call xgl_arc_list_new
   Xgl_arc_list delete = void call xgl_arc_list_delete

  -- create nil proxy
  visibility: publicSlot
   void nilArcList = proxy_null Xgl_arc_list* Xgl_arc_list_seal {xgl arcList deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_arc_list at: unsigned_int = proxy_null Xgl_arc_list* Xgl_arc_list_seal {xgl arcList deadCopy} call xgl_arc_list_at
   Xgl_arc_list at: unsigned_int Put: Xgl_arc_list = void call xgl_arc_list_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_arc_list arcs_ad3d = Xgl_arc_ad3d {xgl arcAd3d deadCopy} call xgl_arc_list_arcs_ad3d
   Xgl_arc_list arcs_ad3d: proxy_null Xgl_arc_ad3d* Xgl_arc_ad3d_seal = void call xgl_arc_list_arcs_ad3d

   Xgl_arc_list arcs_af3d = Xgl_arc_af3d {xgl arcAf3d deadCopy} call xgl_arc_list_arcs_af3d
   Xgl_arc_list arcs_af3d: proxy_null Xgl_arc_af3d* Xgl_arc_af3d_seal = void call xgl_arc_list_arcs_af3d

   Xgl_arc_list arcs_d2d = Xgl_arc_d2d {xgl arcD2d deadCopy} call xgl_arc_list_arcs_d2d
   Xgl_arc_list arcs_d2d: proxy_null Xgl_arc_d2d* Xgl_arc_d2d_seal = void call xgl_arc_list_arcs_d2d

   Xgl_arc_list arcs_d3d = Xgl_arc_d3d {xgl arcD3d deadCopy} call xgl_arc_list_arcs_d3d
   Xgl_arc_list arcs_d3d: proxy_null Xgl_arc_d3d* Xgl_arc_d3d_seal = void call xgl_arc_list_arcs_d3d

   Xgl_arc_list arcs_f2d = Xgl_arc_f2d {xgl arcF2d deadCopy} call xgl_arc_list_arcs_f2d
   Xgl_arc_list arcs_f2d: proxy_null Xgl_arc_f2d* Xgl_arc_f2d_seal = void call xgl_arc_list_arcs_f2d

   Xgl_arc_list arcs_f3d = Xgl_arc_f3d {xgl arcF3d deadCopy} call xgl_arc_list_arcs_f3d
   Xgl_arc_list arcs_f3d: proxy_null Xgl_arc_f3d* Xgl_arc_f3d_seal = void call xgl_arc_list_arcs_f3d

   Xgl_arc_list arcs_i2d = Xgl_arc_i2d {xgl arcI2d deadCopy} call xgl_arc_list_arcs_i2d
   Xgl_arc_list arcs_i2d: proxy_null Xgl_arc_i2d* Xgl_arc_i2d_seal = void call xgl_arc_list_arcs_i2d

   Xgl_arc_list bbox = Xgl_bbox {xgl bbox deadCopy} getMember bbox
   Xgl_arc_list bbox: proxy_null Xgl_bbox* Xgl_bbox_seal = void setMember bbox

   Xgl_arc_list num_arcs = unsigned_long getMember num_arcs
   Xgl_arc_list num_arcs: unsigned_long = void setMember num_arcs

   Xgl_arc_list type = any Xgl_multiarc_type getMember type
   Xgl_arc_list type: any Xgl_multiarc_type = void setMember type

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_arc_list set_Arcs_ad3d: proxy_null Xgl_arc_ad3d* Xgl_arc_ad3d_seal \
	Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_arcs: unsigned_long \
	Type: any Xgl_multiarc_type \
	 = void call xgl_arc_list_set

   Xgl_arc_list set_Arcs_af3d: proxy_null Xgl_arc_af3d* Xgl_arc_af3d_seal \
	Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_arcs: unsigned_long \
	Type: any Xgl_multiarc_type \
	 = void call xgl_arc_list_set

   Xgl_arc_list set_Arcs_d2d: proxy_null Xgl_arc_d2d* Xgl_arc_d2d_seal \
	Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_arcs: unsigned_long \
	Type: any Xgl_multiarc_type \
	 = void call xgl_arc_list_set

   Xgl_arc_list set_Arcs_d3d: proxy_null Xgl_arc_d3d* Xgl_arc_d3d_seal \
	Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_arcs: unsigned_long \
	Type: any Xgl_multiarc_type \
	 = void call xgl_arc_list_set

   Xgl_arc_list set_Arcs_f2d: proxy_null Xgl_arc_f2d* Xgl_arc_f2d_seal \
	Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_arcs: unsigned_long \
	Type: any Xgl_multiarc_type \
	 = void call xgl_arc_list_set

   Xgl_arc_list set_Arcs_f3d: proxy_null Xgl_arc_f3d* Xgl_arc_f3d_seal \
	Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_arcs: unsigned_long \
	Type: any Xgl_multiarc_type \
	 = void call xgl_arc_list_set

   Xgl_arc_list set_Arcs_i2d: proxy_null Xgl_arc_i2d* Xgl_arc_i2d_seal \
	Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_arcs: unsigned_long \
	Type: any Xgl_multiarc_type \
	 = void call xgl_arc_list_set


traits: traits xgl raw bbox
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_bbox {xgl bbox deadCopy} call xgl_bbox_new
   Xgl_bbox delete = void call xgl_bbox_delete

  -- create nil proxy
  visibility: publicSlot
   void nilBbox = proxy_null Xgl_bbox* Xgl_bbox_seal {xgl bbox deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_bbox at: unsigned_int = proxy_null Xgl_bbox* Xgl_bbox_seal {xgl bbox deadCopy} call xgl_bbox_at
   Xgl_bbox at: unsigned_int Put: Xgl_bbox = void call xgl_bbox_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_bbox bbox_type = any Xgl_bbox_type getMember bbox_type
   Xgl_bbox bbox_type: any Xgl_bbox_type = void setMember bbox_type

   Xgl_bbox box_f2d = Xgl_bounds_f2d {xgl boundsF2d deadCopy} call xgl_bbox_box_f2d
   Xgl_bbox box_f2d: Xgl_bounds_f2d = void call xgl_bbox_box_f2d

   Xgl_bbox box_f3d = Xgl_bounds_f3d {xgl boundsF3d deadCopy} call xgl_bbox_box_f3d
   Xgl_bbox box_f3d: Xgl_bounds_f3d = void call xgl_bbox_box_f3d

   Xgl_bbox box_i2d = Xgl_bounds_i2d {xgl boundsI2d deadCopy} call xgl_bbox_box_i2d
   Xgl_bbox box_i2d: Xgl_bounds_i2d = void call xgl_bbox_box_i2d

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_bbox set_Bbox_type: any Xgl_bbox_type \
	Box_f2d: Xgl_bounds_f2d \
	 = void call xgl_bbox_set

   Xgl_bbox set_Bbox_type: any Xgl_bbox_type \
	Box_f3d: Xgl_bounds_f3d \
	 = void call xgl_bbox_set

   Xgl_bbox set_Bbox_type: any Xgl_bbox_type \
	Box_i2d: Xgl_bounds_i2d \
	 = void call xgl_bbox_set


traits: traits xgl raw bboxD2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_bbox_d2d {xgl bboxD2d deadCopy} call xgl_bbox_d2d_new
   Xgl_bbox_d2d delete = void call xgl_bbox_d2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilBboxD2d = proxy_null Xgl_bbox_d2d* Xgl_bbox_d2d_seal {xgl bboxD2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_bbox_d2d at: unsigned_int = proxy_null Xgl_bbox_d2d* Xgl_bbox_d2d_seal {xgl bboxD2d deadCopy} call xgl_bbox_d2d_at
   Xgl_bbox_d2d at: unsigned_int Put: Xgl_bbox_d2d = void call xgl_bbox_d2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_bbox_d2d bbox_type = any Xgl_bbox_type getMember bbox_type
   Xgl_bbox_d2d bbox_type: any Xgl_bbox_type = void setMember bbox_type

   Xgl_bbox_d2d box_d2d = Xgl_bounds_d2d {xgl boundsD2d deadCopy} call xgl_bbox_d2d_box_d2d
   Xgl_bbox_d2d box_d2d: Xgl_bounds_d2d = void call xgl_bbox_d2d_box_d2d

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_bbox_d2d set_Bbox_type: any Xgl_bbox_type \
	Box_d2d: Xgl_bounds_d2d \
	 = void call xgl_bbox_d2d_set


traits: traits xgl raw bboxD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_bbox_d3d {xgl bboxD3d deadCopy} call xgl_bbox_d3d_new
   Xgl_bbox_d3d delete = void call xgl_bbox_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilBboxD3d = proxy_null Xgl_bbox_d3d* Xgl_bbox_d3d_seal {xgl bboxD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_bbox_d3d at: unsigned_int = proxy_null Xgl_bbox_d3d* Xgl_bbox_d3d_seal {xgl bboxD3d deadCopy} call xgl_bbox_d3d_at
   Xgl_bbox_d3d at: unsigned_int Put: Xgl_bbox_d3d = void call xgl_bbox_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_bbox_d3d bbox_type = any Xgl_bbox_type getMember bbox_type
   Xgl_bbox_d3d bbox_type: any Xgl_bbox_type = void setMember bbox_type

   Xgl_bbox_d3d box_d3d = Xgl_bounds_d3d {xgl boundsD3d deadCopy} call xgl_bbox_d3d_box_d3d
   Xgl_bbox_d3d box_d3d: Xgl_bounds_d3d = void call xgl_bbox_d3d_box_d3d

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_bbox_d3d set_Bbox_type: any Xgl_bbox_type \
	Box_d3d: Xgl_bounds_d3d \
	 = void call xgl_bbox_d3d_set


traits: traits xgl raw bboxF2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_bbox_f2d {xgl bboxF2d deadCopy} call xgl_bbox_f2d_new
   Xgl_bbox_f2d delete = void call xgl_bbox_f2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilBboxF2d = proxy_null Xgl_bbox_f2d* Xgl_bbox_f2d_seal {xgl bboxF2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_bbox_f2d at: unsigned_int = proxy_null Xgl_bbox_f2d* Xgl_bbox_f2d_seal {xgl bboxF2d deadCopy} call xgl_bbox_f2d_at
   Xgl_bbox_f2d at: unsigned_int Put: Xgl_bbox_f2d = void call xgl_bbox_f2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_bbox_f2d bbox_type = any Xgl_bbox_type getMember bbox_type
   Xgl_bbox_f2d bbox_type: any Xgl_bbox_type = void setMember bbox_type

   Xgl_bbox_f2d box_f2d = Xgl_bounds_f2d {xgl boundsF2d deadCopy} call xgl_bbox_f2d_box_f2d
   Xgl_bbox_f2d box_f2d: Xgl_bounds_f2d = void call xgl_bbox_f2d_box_f2d

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_bbox_f2d set_Bbox_type: any Xgl_bbox_type \
	Box_f2d: Xgl_bounds_f2d \
	 = void call xgl_bbox_f2d_set


traits: traits xgl raw bboxF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_bbox_f3d {xgl bboxF3d deadCopy} call xgl_bbox_f3d_new
   Xgl_bbox_f3d delete = void call xgl_bbox_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilBboxF3d = proxy_null Xgl_bbox_f3d* Xgl_bbox_f3d_seal {xgl bboxF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_bbox_f3d at: unsigned_int = proxy_null Xgl_bbox_f3d* Xgl_bbox_f3d_seal {xgl bboxF3d deadCopy} call xgl_bbox_f3d_at
   Xgl_bbox_f3d at: unsigned_int Put: Xgl_bbox_f3d = void call xgl_bbox_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_bbox_f3d bbox_type = any Xgl_bbox_type getMember bbox_type
   Xgl_bbox_f3d bbox_type: any Xgl_bbox_type = void setMember bbox_type

   Xgl_bbox_f3d box_f3d = Xgl_bounds_f3d {xgl boundsF3d deadCopy} call xgl_bbox_f3d_box_f3d
   Xgl_bbox_f3d box_f3d: Xgl_bounds_f3d = void call xgl_bbox_f3d_box_f3d

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_bbox_f3d set_Bbox_type: any Xgl_bbox_type \
	Box_f3d: Xgl_bounds_f3d \
	 = void call xgl_bbox_f3d_set


traits: traits xgl raw bboxI2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_bbox_i2d {xgl bboxI2d deadCopy} call xgl_bbox_i2d_new
   Xgl_bbox_i2d delete = void call xgl_bbox_i2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilBboxI2d = proxy_null Xgl_bbox_i2d* Xgl_bbox_i2d_seal {xgl bboxI2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_bbox_i2d at: unsigned_int = proxy_null Xgl_bbox_i2d* Xgl_bbox_i2d_seal {xgl bboxI2d deadCopy} call xgl_bbox_i2d_at
   Xgl_bbox_i2d at: unsigned_int Put: Xgl_bbox_i2d = void call xgl_bbox_i2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_bbox_i2d bbox_type = any Xgl_bbox_type getMember bbox_type
   Xgl_bbox_i2d bbox_type: any Xgl_bbox_type = void setMember bbox_type

   Xgl_bbox_i2d box_i2d = Xgl_bounds_i2d {xgl boundsI2d deadCopy} call xgl_bbox_i2d_box_i2d
   Xgl_bbox_i2d box_i2d: Xgl_bounds_i2d = void call xgl_bbox_i2d_box_i2d

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_bbox_i2d set_Bbox_type: any Xgl_bbox_type \
	Box_i2d: Xgl_bounds_i2d \
	 = void call xgl_bbox_i2d_set


traits: traits xgl raw bboxStatus
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_bbox_status {xgl bboxStatus deadCopy} call xgl_bbox_status_new
   Xgl_bbox_status delete = void call xgl_bbox_status_delete

  -- create nil proxy
  visibility: publicSlot
   void nilBboxStatus = proxy_null Xgl_bbox_status* Xgl_bbox_status_seal {xgl bboxStatus deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_bbox_status at: unsigned_int = proxy_null Xgl_bbox_status* Xgl_bbox_status_seal {xgl bboxStatus deadCopy} call xgl_bbox_status_at
   Xgl_bbox_status at: unsigned_int Put: Xgl_bbox_status = void call xgl_bbox_status_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_bbox_status bbox_type = any Xgl_bbox_type getMember bbox_type
   Xgl_bbox_status bbox_type: any Xgl_bbox_type = void setMember bbox_type

   Xgl_bbox_status box_status = any Xgl_geom_status call xgl_bbox_status_box_status
   Xgl_bbox_status box_status: any Xgl_geom_status = void call xgl_bbox_status_box_status

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_bbox_status set_Bbox_type: any Xgl_bbox_type \
	Box_status: any Xgl_geom_status \
	 = void call xgl_bbox_status_set


traits: traits xgl raw boundsD1d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_bounds_d1d {xgl boundsD1d deadCopy} call xgl_bounds_d1d_new
   Xgl_bounds_d1d delete = void call xgl_bounds_d1d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilBoundsD1d = proxy_null Xgl_bounds_d1d* Xgl_bounds_d1d_seal {xgl boundsD1d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_bounds_d1d at: unsigned_int = proxy_null Xgl_bounds_d1d* Xgl_bounds_d1d_seal {xgl boundsD1d deadCopy} call xgl_bounds_d1d_at
   Xgl_bounds_d1d at: unsigned_int Put: Xgl_bounds_d1d = void call xgl_bounds_d1d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_bounds_d1d bmax = double getMember bmax
   Xgl_bounds_d1d bmax: double = void setMember bmax

   Xgl_bounds_d1d bmin = double getMember bmin
   Xgl_bounds_d1d bmin: double = void setMember bmin


traits: traits xgl raw boundsD2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_bounds_d2d {xgl boundsD2d deadCopy} call xgl_bounds_d2d_new
   Xgl_bounds_d2d delete = void call xgl_bounds_d2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilBoundsD2d = proxy_null Xgl_bounds_d2d* Xgl_bounds_d2d_seal {xgl boundsD2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_bounds_d2d at: unsigned_int = proxy_null Xgl_bounds_d2d* Xgl_bounds_d2d_seal {xgl boundsD2d deadCopy} call xgl_bounds_d2d_at
   Xgl_bounds_d2d at: unsigned_int Put: Xgl_bounds_d2d = void call xgl_bounds_d2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_bounds_d2d xmax = double getMember xmax
   Xgl_bounds_d2d xmax: double = void setMember xmax

   Xgl_bounds_d2d xmin = double getMember xmin
   Xgl_bounds_d2d xmin: double = void setMember xmin

   Xgl_bounds_d2d ymax = double getMember ymax
   Xgl_bounds_d2d ymax: double = void setMember ymax

   Xgl_bounds_d2d ymin = double getMember ymin
   Xgl_bounds_d2d ymin: double = void setMember ymin

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_bounds_d2d set_Xmax: double \
	Xmin: double \
	Ymax: double \
	Ymin: double \
	 = void call xgl_bounds_d2d_set


traits: traits xgl raw boundsD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_bounds_d3d {xgl boundsD3d deadCopy} call xgl_bounds_d3d_new
   Xgl_bounds_d3d delete = void call xgl_bounds_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilBoundsD3d = proxy_null Xgl_bounds_d3d* Xgl_bounds_d3d_seal {xgl boundsD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_bounds_d3d at: unsigned_int = proxy_null Xgl_bounds_d3d* Xgl_bounds_d3d_seal {xgl boundsD3d deadCopy} call xgl_bounds_d3d_at
   Xgl_bounds_d3d at: unsigned_int Put: Xgl_bounds_d3d = void call xgl_bounds_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_bounds_d3d xmax = double getMember xmax
   Xgl_bounds_d3d xmax: double = void setMember xmax

   Xgl_bounds_d3d xmin = double getMember xmin
   Xgl_bounds_d3d xmin: double = void setMember xmin

   Xgl_bounds_d3d ymax = double getMember ymax
   Xgl_bounds_d3d ymax: double = void setMember ymax

   Xgl_bounds_d3d ymin = double getMember ymin
   Xgl_bounds_d3d ymin: double = void setMember ymin

   Xgl_bounds_d3d zmax = double getMember zmax
   Xgl_bounds_d3d zmax: double = void setMember zmax

   Xgl_bounds_d3d zmin = double getMember zmin
   Xgl_bounds_d3d zmin: double = void setMember zmin

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_bounds_d3d set_Xmax: double \
	Xmin: double \
	Ymax: double \
	Ymin: double \
	Zmax: double \
	Zmin: double \
	 = void call xgl_bounds_d3d_set


traits: traits xgl raw boundsF1d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_bounds_f1d {xgl boundsF1d deadCopy} call xgl_bounds_f1d_new
   Xgl_bounds_f1d delete = void call xgl_bounds_f1d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilBoundsF1d = proxy_null Xgl_bounds_f1d* Xgl_bounds_f1d_seal {xgl boundsF1d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_bounds_f1d at: unsigned_int = proxy_null Xgl_bounds_f1d* Xgl_bounds_f1d_seal {xgl boundsF1d deadCopy} call xgl_bounds_f1d_at
   Xgl_bounds_f1d at: unsigned_int Put: Xgl_bounds_f1d = void call xgl_bounds_f1d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_bounds_f1d bmax = float getMember bmax
   Xgl_bounds_f1d bmax: float = void setMember bmax

   Xgl_bounds_f1d bmin = float getMember bmin
   Xgl_bounds_f1d bmin: float = void setMember bmin


traits: traits xgl raw boundsF2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_bounds_f2d {xgl boundsF2d deadCopy} call xgl_bounds_f2d_new
   Xgl_bounds_f2d delete = void call xgl_bounds_f2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilBoundsF2d = proxy_null Xgl_bounds_f2d* Xgl_bounds_f2d_seal {xgl boundsF2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_bounds_f2d at: unsigned_int = proxy_null Xgl_bounds_f2d* Xgl_bounds_f2d_seal {xgl boundsF2d deadCopy} call xgl_bounds_f2d_at
   Xgl_bounds_f2d at: unsigned_int Put: Xgl_bounds_f2d = void call xgl_bounds_f2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_bounds_f2d xmax = float getMember xmax
   Xgl_bounds_f2d xmax: float = void setMember xmax

   Xgl_bounds_f2d xmin = float getMember xmin
   Xgl_bounds_f2d xmin: float = void setMember xmin

   Xgl_bounds_f2d ymax = float getMember ymax
   Xgl_bounds_f2d ymax: float = void setMember ymax

   Xgl_bounds_f2d ymin = float getMember ymin
   Xgl_bounds_f2d ymin: float = void setMember ymin

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_bounds_f2d set_Xmax: float \
	Xmin: float \
	Ymax: float \
	Ymin: float \
	 = void call xgl_bounds_f2d_set


traits: traits xgl raw boundsF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_bounds_f3d {xgl boundsF3d deadCopy} call xgl_bounds_f3d_new
   Xgl_bounds_f3d delete = void call xgl_bounds_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilBoundsF3d = proxy_null Xgl_bounds_f3d* Xgl_bounds_f3d_seal {xgl boundsF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_bounds_f3d at: unsigned_int = proxy_null Xgl_bounds_f3d* Xgl_bounds_f3d_seal {xgl boundsF3d deadCopy} call xgl_bounds_f3d_at
   Xgl_bounds_f3d at: unsigned_int Put: Xgl_bounds_f3d = void call xgl_bounds_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_bounds_f3d xmax = float getMember xmax
   Xgl_bounds_f3d xmax: float = void setMember xmax

   Xgl_bounds_f3d xmin = float getMember xmin
   Xgl_bounds_f3d xmin: float = void setMember xmin

   Xgl_bounds_f3d ymax = float getMember ymax
   Xgl_bounds_f3d ymax: float = void setMember ymax

   Xgl_bounds_f3d ymin = float getMember ymin
   Xgl_bounds_f3d ymin: float = void setMember ymin

   Xgl_bounds_f3d zmax = float getMember zmax
   Xgl_bounds_f3d zmax: float = void setMember zmax

   Xgl_bounds_f3d zmin = float getMember zmin
   Xgl_bounds_f3d zmin: float = void setMember zmin

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_bounds_f3d set_Xmax: float \
	Xmin: float \
	Ymax: float \
	Ymin: float \
	Zmax: float \
	Zmin: float \
	 = void call xgl_bounds_f3d_set


traits: traits xgl raw boundsI2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_bounds_i2d {xgl boundsI2d deadCopy} call xgl_bounds_i2d_new
   Xgl_bounds_i2d delete = void call xgl_bounds_i2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilBoundsI2d = proxy_null Xgl_bounds_i2d* Xgl_bounds_i2d_seal {xgl boundsI2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_bounds_i2d at: unsigned_int = proxy_null Xgl_bounds_i2d* Xgl_bounds_i2d_seal {xgl boundsI2d deadCopy} call xgl_bounds_i2d_at
   Xgl_bounds_i2d at: unsigned_int Put: Xgl_bounds_i2d = void call xgl_bounds_i2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_bounds_i2d xmax = long getMember xmax
   Xgl_bounds_i2d xmax: long = void setMember xmax

   Xgl_bounds_i2d xmin = long getMember xmin
   Xgl_bounds_i2d xmin: long = void setMember xmin

   Xgl_bounds_i2d ymax = long getMember ymax
   Xgl_bounds_i2d ymax: long = void setMember ymax

   Xgl_bounds_i2d ymin = long getMember ymin
   Xgl_bounds_i2d ymin: long = void setMember ymin

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_bounds_i2d set_Xmax: long \
	Xmin: long \
	Ymax: long \
	Ymin: long \
	 = void call xgl_bounds_i2d_set


traits: traits xgl raw circleAd3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_circle_ad3d {xgl circleAd3d deadCopy} call xgl_circle_ad3d_new
   Xgl_circle_ad3d delete = void call xgl_circle_ad3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilCircleAd3d = proxy_null Xgl_circle_ad3d* Xgl_circle_ad3d_seal {xgl circleAd3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_circle_ad3d at: unsigned_int = proxy_null Xgl_circle_ad3d* Xgl_circle_ad3d_seal {xgl circleAd3d deadCopy} call xgl_circle_ad3d_at
   Xgl_circle_ad3d at: unsigned_int Put: Xgl_circle_ad3d = void call xgl_circle_ad3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_circle_ad3d center = Xgl_pt_flag_d3d {xgl ptFlagD3d deadCopy} call xgl_circle_ad3d_center
   Xgl_circle_ad3d center: Xgl_pt_flag_d3d = void call xgl_circle_ad3d_center

   Xgl_circle_ad3d radius = double getMember radius
   Xgl_circle_ad3d radius: double = void setMember radius


traits: traits xgl raw circleAf3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_circle_af3d {xgl circleAf3d deadCopy} call xgl_circle_af3d_new
   Xgl_circle_af3d delete = void call xgl_circle_af3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilCircleAf3d = proxy_null Xgl_circle_af3d* Xgl_circle_af3d_seal {xgl circleAf3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_circle_af3d at: unsigned_int = proxy_null Xgl_circle_af3d* Xgl_circle_af3d_seal {xgl circleAf3d deadCopy} call xgl_circle_af3d_at
   Xgl_circle_af3d at: unsigned_int Put: Xgl_circle_af3d = void call xgl_circle_af3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_circle_af3d center = Xgl_pt_flag_f3d {xgl ptFlagF3d deadCopy} call xgl_circle_af3d_center
   Xgl_circle_af3d center: Xgl_pt_flag_f3d = void call xgl_circle_af3d_center

   Xgl_circle_af3d radius = float getMember radius
   Xgl_circle_af3d radius: float = void setMember radius


traits: traits xgl raw circleD2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_circle_d2d {xgl circleD2d deadCopy} call xgl_circle_d2d_new
   Xgl_circle_d2d delete = void call xgl_circle_d2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilCircleD2d = proxy_null Xgl_circle_d2d* Xgl_circle_d2d_seal {xgl circleD2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_circle_d2d at: unsigned_int = proxy_null Xgl_circle_d2d* Xgl_circle_d2d_seal {xgl circleD2d deadCopy} call xgl_circle_d2d_at
   Xgl_circle_d2d at: unsigned_int Put: Xgl_circle_d2d = void call xgl_circle_d2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_circle_d2d center = Xgl_pt_flag_d2d {xgl ptFlagD2d deadCopy} call xgl_circle_d2d_center
   Xgl_circle_d2d center: Xgl_pt_flag_d2d = void call xgl_circle_d2d_center

   Xgl_circle_d2d radius = double getMember radius
   Xgl_circle_d2d radius: double = void setMember radius


traits: traits xgl raw circleD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_circle_d3d {xgl circleD3d deadCopy} call xgl_circle_d3d_new
   Xgl_circle_d3d delete = void call xgl_circle_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilCircleD3d = proxy_null Xgl_circle_d3d* Xgl_circle_d3d_seal {xgl circleD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_circle_d3d at: unsigned_int = proxy_null Xgl_circle_d3d* Xgl_circle_d3d_seal {xgl circleD3d deadCopy} call xgl_circle_d3d_at
   Xgl_circle_d3d at: unsigned_int Put: Xgl_circle_d3d = void call xgl_circle_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_circle_d3d center = Xgl_pt_flag_d3d {xgl ptFlagD3d deadCopy} call xgl_circle_d3d_center
   Xgl_circle_d3d center: Xgl_pt_flag_d3d = void call xgl_circle_d3d_center

   Xgl_circle_d3d dir = Xgl_pt_d3d {xgl ptD3d deadCopy} call xgl_circle_d3d_dir

   Xgl_circle_d3d dir_normal = bool getMember dir_normal
   Xgl_circle_d3d dir_normal: bool = void setMember dir_normal

   Xgl_circle_d3d dir_normalized = bool getMember dir_normalized
   Xgl_circle_d3d dir_normalized: bool = void setMember dir_normalized

   Xgl_circle_d3d radius = double getMember radius
   Xgl_circle_d3d radius: double = void setMember radius

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_circle_d3d set_Center: Xgl_pt_flag_d3d \
	Dir_normal: bool \
	Dir_normalized: bool \
	Radius: double \
	 = void call xgl_circle_d3d_set


traits: traits xgl raw circleF2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_circle_f2d {xgl circleF2d deadCopy} call xgl_circle_f2d_new
   Xgl_circle_f2d delete = void call xgl_circle_f2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilCircleF2d = proxy_null Xgl_circle_f2d* Xgl_circle_f2d_seal {xgl circleF2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_circle_f2d at: unsigned_int = proxy_null Xgl_circle_f2d* Xgl_circle_f2d_seal {xgl circleF2d deadCopy} call xgl_circle_f2d_at
   Xgl_circle_f2d at: unsigned_int Put: Xgl_circle_f2d = void call xgl_circle_f2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_circle_f2d center = Xgl_pt_flag_f2d {xgl ptFlagF2d deadCopy} call xgl_circle_f2d_center
   Xgl_circle_f2d center: Xgl_pt_flag_f2d = void call xgl_circle_f2d_center

   Xgl_circle_f2d radius = float getMember radius
   Xgl_circle_f2d radius: float = void setMember radius


traits: traits xgl raw circleF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_circle_f3d {xgl circleF3d deadCopy} call xgl_circle_f3d_new
   Xgl_circle_f3d delete = void call xgl_circle_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilCircleF3d = proxy_null Xgl_circle_f3d* Xgl_circle_f3d_seal {xgl circleF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_circle_f3d at: unsigned_int = proxy_null Xgl_circle_f3d* Xgl_circle_f3d_seal {xgl circleF3d deadCopy} call xgl_circle_f3d_at
   Xgl_circle_f3d at: unsigned_int Put: Xgl_circle_f3d = void call xgl_circle_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_circle_f3d center = Xgl_pt_flag_f3d {xgl ptFlagF3d deadCopy} call xgl_circle_f3d_center
   Xgl_circle_f3d center: Xgl_pt_flag_f3d = void call xgl_circle_f3d_center

   Xgl_circle_f3d dir = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_circle_f3d_dir

   Xgl_circle_f3d dir_normal = bool getMember dir_normal
   Xgl_circle_f3d dir_normal: bool = void setMember dir_normal

   Xgl_circle_f3d dir_normalized = bool getMember dir_normalized
   Xgl_circle_f3d dir_normalized: bool = void setMember dir_normalized

   Xgl_circle_f3d radius = float getMember radius
   Xgl_circle_f3d radius: float = void setMember radius

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_circle_f3d set_Center: Xgl_pt_flag_f3d \
	Dir_normal: bool \
	Dir_normalized: bool \
	Radius: float \
	 = void call xgl_circle_f3d_set


traits: traits xgl raw circleI2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_circle_i2d {xgl circleI2d deadCopy} call xgl_circle_i2d_new
   Xgl_circle_i2d delete = void call xgl_circle_i2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilCircleI2d = proxy_null Xgl_circle_i2d* Xgl_circle_i2d_seal {xgl circleI2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_circle_i2d at: unsigned_int = proxy_null Xgl_circle_i2d* Xgl_circle_i2d_seal {xgl circleI2d deadCopy} call xgl_circle_i2d_at
   Xgl_circle_i2d at: unsigned_int Put: Xgl_circle_i2d = void call xgl_circle_i2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_circle_i2d center = Xgl_pt_flag_i2d {xgl ptFlagI2d deadCopy} call xgl_circle_i2d_center
   Xgl_circle_i2d center: Xgl_pt_flag_i2d = void call xgl_circle_i2d_center

   Xgl_circle_i2d radius = unsigned_long getMember radius
   Xgl_circle_i2d radius: unsigned_long = void setMember radius


traits: traits xgl raw circleList
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_circle_list {xgl circleList deadCopy} call xgl_circle_list_new
   Xgl_circle_list delete = void call xgl_circle_list_delete

  -- create nil proxy
  visibility: publicSlot
   void nilCircleList = proxy_null Xgl_circle_list* Xgl_circle_list_seal {xgl circleList deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_circle_list at: unsigned_int = proxy_null Xgl_circle_list* Xgl_circle_list_seal {xgl circleList deadCopy} call xgl_circle_list_at
   Xgl_circle_list at: unsigned_int Put: Xgl_circle_list = void call xgl_circle_list_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_circle_list bbox = Xgl_bbox {xgl bbox deadCopy} getMember bbox
   Xgl_circle_list bbox: proxy_null Xgl_bbox* Xgl_bbox_seal = void setMember bbox

   Xgl_circle_list circles_ad3d = Xgl_circle_ad3d {xgl circleAd3d deadCopy} call xgl_circle_list_circles_ad3d
   Xgl_circle_list circles_ad3d: proxy_null Xgl_circle_ad3d* Xgl_circle_ad3d_seal = void call xgl_circle_list_circles_ad3d

   Xgl_circle_list circles_af3d = Xgl_circle_af3d {xgl circleAf3d deadCopy} call xgl_circle_list_circles_af3d
   Xgl_circle_list circles_af3d: proxy_null Xgl_circle_af3d* Xgl_circle_af3d_seal = void call xgl_circle_list_circles_af3d

   Xgl_circle_list circles_d2d = Xgl_circle_d2d {xgl circleD2d deadCopy} call xgl_circle_list_circles_d2d
   Xgl_circle_list circles_d2d: proxy_null Xgl_circle_d2d* Xgl_circle_d2d_seal = void call xgl_circle_list_circles_d2d

   Xgl_circle_list circles_d3d = Xgl_circle_d3d {xgl circleD3d deadCopy} call xgl_circle_list_circles_d3d
   Xgl_circle_list circles_d3d: proxy_null Xgl_circle_d3d* Xgl_circle_d3d_seal = void call xgl_circle_list_circles_d3d

   Xgl_circle_list circles_f2d = Xgl_circle_f2d {xgl circleF2d deadCopy} call xgl_circle_list_circles_f2d
   Xgl_circle_list circles_f2d: proxy_null Xgl_circle_f2d* Xgl_circle_f2d_seal = void call xgl_circle_list_circles_f2d

   Xgl_circle_list circles_f3d = Xgl_circle_f3d {xgl circleF3d deadCopy} call xgl_circle_list_circles_f3d
   Xgl_circle_list circles_f3d: proxy_null Xgl_circle_f3d* Xgl_circle_f3d_seal = void call xgl_circle_list_circles_f3d

   Xgl_circle_list circles_i2d = Xgl_circle_i2d {xgl circleI2d deadCopy} call xgl_circle_list_circles_i2d
   Xgl_circle_list circles_i2d: proxy_null Xgl_circle_i2d* Xgl_circle_i2d_seal = void call xgl_circle_list_circles_i2d

   Xgl_circle_list num_circles = unsigned_long getMember num_circles
   Xgl_circle_list num_circles: unsigned_long = void setMember num_circles

   Xgl_circle_list type = any Xgl_multicircle_type getMember type
   Xgl_circle_list type: any Xgl_multicircle_type = void setMember type

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_circle_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Circles_ad3d: proxy_null Xgl_circle_ad3d* Xgl_circle_ad3d_seal \
	Num_circles: unsigned_long \
	Type: any Xgl_multicircle_type \
	 = void call xgl_circle_list_set

   Xgl_circle_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Circles_af3d: proxy_null Xgl_circle_af3d* Xgl_circle_af3d_seal \
	Num_circles: unsigned_long \
	Type: any Xgl_multicircle_type \
	 = void call xgl_circle_list_set

   Xgl_circle_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Circles_d2d: proxy_null Xgl_circle_d2d* Xgl_circle_d2d_seal \
	Num_circles: unsigned_long \
	Type: any Xgl_multicircle_type \
	 = void call xgl_circle_list_set

   Xgl_circle_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Circles_d3d: proxy_null Xgl_circle_d3d* Xgl_circle_d3d_seal \
	Num_circles: unsigned_long \
	Type: any Xgl_multicircle_type \
	 = void call xgl_circle_list_set

   Xgl_circle_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Circles_f2d: proxy_null Xgl_circle_f2d* Xgl_circle_f2d_seal \
	Num_circles: unsigned_long \
	Type: any Xgl_multicircle_type \
	 = void call xgl_circle_list_set

   Xgl_circle_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Circles_f3d: proxy_null Xgl_circle_f3d* Xgl_circle_f3d_seal \
	Num_circles: unsigned_long \
	Type: any Xgl_multicircle_type \
	 = void call xgl_circle_list_set

   Xgl_circle_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Circles_i2d: proxy_null Xgl_circle_i2d* Xgl_circle_i2d_seal \
	Num_circles: unsigned_long \
	Type: any Xgl_multicircle_type \
	 = void call xgl_circle_list_set

','

traits: traits xgl raw color
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_color {xgl color deadCopy} call xgl_color_new
   Xgl_color delete = void call xgl_color_delete

  -- create nil proxy
  visibility: publicSlot
   void nilColor = proxy_null Xgl_color* Xgl_color_seal {xgl color deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_color at: unsigned_int = proxy_null Xgl_color* Xgl_color_seal {xgl color deadCopy} call xgl_color_at
   Xgl_color at: unsigned_int Put: Xgl_color = void call xgl_color_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_color gray = float getMember gray
   Xgl_color gray: float = void setMember gray

   Xgl_color index = unsigned_long getMember index
   Xgl_color index: unsigned_long = void setMember index

   Xgl_color rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_color_rgb
   Xgl_color rgb: Xgl_color_rgb = void call xgl_color_rgb

   Xgl_color z = unsigned_long getMember z
   Xgl_color z: unsigned_long = void setMember z


traits: traits xgl raw colorFacet
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_color_facet {xgl colorFacet deadCopy} call xgl_color_facet_new
   Xgl_color_facet delete = void call xgl_color_facet_delete

  -- create nil proxy
  visibility: publicSlot
   void nilColorFacet = proxy_null Xgl_color_facet* Xgl_color_facet_seal {xgl colorFacet deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_color_facet at: unsigned_int = proxy_null Xgl_color_facet* Xgl_color_facet_seal {xgl colorFacet deadCopy} call xgl_color_facet_at
   Xgl_color_facet at: unsigned_int Put: Xgl_color_facet = void call xgl_color_facet_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_color_facet color_gray = float call xgl_color_facet_color_gray
   Xgl_color_facet color_gray: float = void call xgl_color_facet_color_gray

   Xgl_color_facet color_index = unsigned_long call xgl_color_facet_color_index
   Xgl_color_facet color_index: unsigned_long = void call xgl_color_facet_color_index

   Xgl_color_facet color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_color_facet_color_rgb
   Xgl_color_facet color_rgb: Xgl_color_rgb = void call xgl_color_facet_color_rgb

   Xgl_color_facet color_z = unsigned_long call xgl_color_facet_color_z
   Xgl_color_facet color_z: unsigned_long = void call xgl_color_facet_color_z


traits: traits xgl raw colorHomogeneous
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_color_homogeneous {xgl colorHomogeneous deadCopy} call xgl_color_homogeneous_new
   Xgl_color_homogeneous delete = void call xgl_color_homogeneous_delete

  -- create nil proxy
  visibility: publicSlot
   void nilColorHomogeneous = proxy_null Xgl_color_homogeneous* Xgl_color_homogeneous_seal {xgl colorHomogeneous deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_color_homogeneous at: unsigned_int = proxy_null Xgl_color_homogeneous* Xgl_color_homogeneous_seal {xgl colorHomogeneous deadCopy} call xgl_color_homogeneous_at
   Xgl_color_homogeneous at: unsigned_int Put: Xgl_color_homogeneous = void call xgl_color_homogeneous_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_color_homogeneous rgbw = Xgl_color_rgbw {xgl colorRgbw deadCopy} call xgl_color_homogeneous_rgbw
   Xgl_color_homogeneous rgbw: Xgl_color_rgbw = void call xgl_color_homogeneous_rgbw


traits: traits xgl raw colorList
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_color_list {xgl colorList deadCopy} call xgl_color_list_new
   Xgl_color_list delete = void call xgl_color_list_delete

  -- create nil proxy
  visibility: publicSlot
   void nilColorList = proxy_null Xgl_color_list* Xgl_color_list_seal {xgl colorList deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_color_list at: unsigned_int = proxy_null Xgl_color_list* Xgl_color_list_seal {xgl colorList deadCopy} call xgl_color_list_at
   Xgl_color_list at: unsigned_int Put: Xgl_color_list = void call xgl_color_list_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_color_list colors = Xgl_color {xgl color deadCopy} getMember colors
   Xgl_color_list colors: proxy_null Xgl_color* Xgl_color_seal = void setMember colors

   Xgl_color_list length = unsigned_long getMember length
   Xgl_color_list length: unsigned_long = void setMember length

   Xgl_color_list start_index = unsigned_long getMember start_index
   Xgl_color_list start_index: unsigned_long = void setMember start_index

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_color_list set_Colors: proxy_null Xgl_color* Xgl_color_seal \
	Length: unsigned_long \
	Start_index: unsigned_long \
	 = void call xgl_color_list_set


traits: traits xgl raw colorNormalFacet
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_color_normal_facet {xgl colorNormalFacet deadCopy} call xgl_color_normal_facet_new
   Xgl_color_normal_facet delete = void call xgl_color_normal_facet_delete

  -- create nil proxy
  visibility: publicSlot
   void nilColorNormalFacet = proxy_null Xgl_color_normal_facet* Xgl_color_normal_facet_seal {xgl colorNormalFacet deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_color_normal_facet at: unsigned_int = proxy_null Xgl_color_normal_facet* Xgl_color_normal_facet_seal {xgl colorNormalFacet deadCopy} call xgl_color_normal_facet_at
   Xgl_color_normal_facet at: unsigned_int Put: Xgl_color_normal_facet = void call xgl_color_normal_facet_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_color_normal_facet color_gray = float call xgl_color_normal_facet_color_gray
   Xgl_color_normal_facet color_gray: float = void call xgl_color_normal_facet_color_gray

   Xgl_color_normal_facet color_index = unsigned_long call xgl_color_normal_facet_color_index
   Xgl_color_normal_facet color_index: unsigned_long = void call xgl_color_normal_facet_color_index

   Xgl_color_normal_facet color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_color_normal_facet_color_rgb
   Xgl_color_normal_facet color_rgb: Xgl_color_rgb = void call xgl_color_normal_facet_color_rgb

   Xgl_color_normal_facet color_z = unsigned_long call xgl_color_normal_facet_color_z
   Xgl_color_normal_facet color_z: unsigned_long = void call xgl_color_normal_facet_color_z

   Xgl_color_normal_facet normal = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_color_normal_facet_normal
   Xgl_color_normal_facet normal: Xgl_pt_f3d = void call xgl_color_normal_facet_normal


traits: traits xgl raw colorRgb
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_color_rgb_new
   Xgl_color_rgb delete = void call xgl_color_rgb_delete

  -- create nil proxy
  visibility: publicSlot
   void nilColorRgb = proxy_null Xgl_color_rgb* Xgl_color_rgb_seal {xgl colorRgb deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_color_rgb at: unsigned_int = proxy_null Xgl_color_rgb* Xgl_color_rgb_seal {xgl colorRgb deadCopy} call xgl_color_rgb_at
   Xgl_color_rgb at: unsigned_int Put: Xgl_color_rgb = void call xgl_color_rgb_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_color_rgb b = float getMember b
   Xgl_color_rgb b: float = void setMember b

   Xgl_color_rgb g = float getMember g
   Xgl_color_rgb g: float = void setMember g

   Xgl_color_rgb r = float getMember r
   Xgl_color_rgb r: float = void setMember r

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_color_rgb set_B: float \
	G: float \
	R: float \
	 = void call xgl_color_rgb_set


traits: traits xgl raw colorRgbw
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_color_rgbw {xgl colorRgbw deadCopy} call xgl_color_rgbw_new
   Xgl_color_rgbw delete = void call xgl_color_rgbw_delete

  -- create nil proxy
  visibility: publicSlot
   void nilColorRgbw = proxy_null Xgl_color_rgbw* Xgl_color_rgbw_seal {xgl colorRgbw deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_color_rgbw at: unsigned_int = proxy_null Xgl_color_rgbw* Xgl_color_rgbw_seal {xgl colorRgbw deadCopy} call xgl_color_rgbw_at
   Xgl_color_rgbw at: unsigned_int Put: Xgl_color_rgbw = void call xgl_color_rgbw_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_color_rgbw b = float getMember b
   Xgl_color_rgbw b: float = void setMember b

   Xgl_color_rgbw g = float getMember g
   Xgl_color_rgbw g: float = void setMember g

   Xgl_color_rgbw r = float getMember r
   Xgl_color_rgbw r: float = void setMember r

   Xgl_color_rgbw w = float getMember w
   Xgl_color_rgbw w: float = void setMember w

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_color_rgbw set_B: float \
	G: float \
	R: float \
	W: float \
	 = void call xgl_color_rgbw_set


traits: traits xgl raw colorTypeSupported
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_color_type_supported {xgl colorTypeSupported deadCopy} call xgl_color_type_supported_new
   Xgl_color_type_supported delete = void call xgl_color_type_supported_delete

  -- create nil proxy
  visibility: publicSlot
   void nilColorTypeSupported = proxy_null Xgl_color_type_supported* Xgl_color_type_supported_seal {xgl colorTypeSupported deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_color_type_supported at: unsigned_int = proxy_null Xgl_color_type_supported* Xgl_color_type_supported_seal {xgl colorTypeSupported deadCopy} call xgl_color_type_supported_at
   Xgl_color_type_supported at: unsigned_int Put: Xgl_color_type_supported = void call xgl_color_type_supported_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_color_type_supported index = unsigned_int getMember index
   Xgl_color_type_supported index: unsigned_int = void setMember index

   Xgl_color_type_supported rgb = unsigned_int getMember rgb
   Xgl_color_type_supported rgb: unsigned_int = void setMember rgb


traits: traits xgl raw curveColorSpline
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_curve_color_spline {xgl curveColorSpline deadCopy} call xgl_curve_color_spline_new
   Xgl_curve_color_spline delete = void call xgl_curve_color_spline_delete

  -- create nil proxy
  visibility: publicSlot
   void nilCurveColorSpline = proxy_null Xgl_curve_color_spline* Xgl_curve_color_spline_seal {xgl curveColorSpline deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_curve_color_spline at: unsigned_int = proxy_null Xgl_curve_color_spline* Xgl_curve_color_spline_seal {xgl curveColorSpline deadCopy} call xgl_curve_color_spline_at
   Xgl_curve_color_spline at: unsigned_int Put: Xgl_curve_color_spline = void call xgl_curve_color_spline_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_curve_color_spline colors = Xgl_color_homogeneous {xgl colorHomogeneous deadCopy} getMember colors
   Xgl_curve_color_spline colors: proxy_null Xgl_color_homogeneous* Xgl_color_homogeneous_seal = void setMember colors

   Xgl_curve_color_spline knot_vector = Float_vec_proxy {xgl floatVecProxy deadCopy} getMember knot_vector
   Xgl_curve_color_spline knot_vector: Float_vec_proxy = void setMember knot_vector

   Xgl_curve_color_spline num_knots = unsigned_long getMember num_knots
   Xgl_curve_color_spline num_knots: unsigned_long = void setMember num_knots

   Xgl_curve_color_spline order = unsigned_long getMember order
   Xgl_curve_color_spline order: unsigned_long = void setMember order

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_curve_color_spline set_Colors: proxy_null Xgl_color_homogeneous* Xgl_color_homogeneous_seal \
	Knot_vector: any float* \
	Num_knots: unsigned_long \
	Order: unsigned_long \
	 = void call xgl_curve_color_spline_set


traits: traits xgl raw ellAd3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_ell_ad3d {xgl ellAd3d deadCopy} call xgl_ell_ad3d_new
   Xgl_ell_ad3d delete = void call xgl_ell_ad3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilEllAd3d = proxy_null Xgl_ell_ad3d* Xgl_ell_ad3d_seal {xgl ellAd3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_ell_ad3d at: unsigned_int = proxy_null Xgl_ell_ad3d* Xgl_ell_ad3d_seal {xgl ellAd3d deadCopy} call xgl_ell_ad3d_at
   Xgl_ell_ad3d at: unsigned_int Put: Xgl_ell_ad3d = void call xgl_ell_ad3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_ell_ad3d center = Xgl_pt_flag_d3d {xgl ptFlagD3d deadCopy} call xgl_ell_ad3d_center
   Xgl_ell_ad3d center: Xgl_pt_flag_d3d = void call xgl_ell_ad3d_center

   Xgl_ell_ad3d major_axis = double getMember major_axis
   Xgl_ell_ad3d major_axis: double = void setMember major_axis

   Xgl_ell_ad3d minor_axis = double getMember minor_axis
   Xgl_ell_ad3d minor_axis: double = void setMember minor_axis

   Xgl_ell_ad3d rot_angle = double getMember rot_angle
   Xgl_ell_ad3d rot_angle: double = void setMember rot_angle

   Xgl_ell_ad3d start_angle = double getMember start_angle
   Xgl_ell_ad3d start_angle: double = void setMember start_angle

   Xgl_ell_ad3d stop_angle = double getMember stop_angle
   Xgl_ell_ad3d stop_angle: double = void setMember stop_angle

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_ell_ad3d set_Center: Xgl_pt_flag_d3d \
	Major_axis: double \
	Minor_axis: double \
	Rot_angle: double \
	Start_angle: double \
	Stop_angle: double \
	 = void call xgl_ell_ad3d_set


traits: traits xgl raw ellAf3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_ell_af3d {xgl ellAf3d deadCopy} call xgl_ell_af3d_new
   Xgl_ell_af3d delete = void call xgl_ell_af3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilEllAf3d = proxy_null Xgl_ell_af3d* Xgl_ell_af3d_seal {xgl ellAf3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_ell_af3d at: unsigned_int = proxy_null Xgl_ell_af3d* Xgl_ell_af3d_seal {xgl ellAf3d deadCopy} call xgl_ell_af3d_at
   Xgl_ell_af3d at: unsigned_int Put: Xgl_ell_af3d = void call xgl_ell_af3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_ell_af3d center = Xgl_pt_flag_f3d {xgl ptFlagF3d deadCopy} call xgl_ell_af3d_center
   Xgl_ell_af3d center: Xgl_pt_flag_f3d = void call xgl_ell_af3d_center

   Xgl_ell_af3d major_axis = float getMember major_axis
   Xgl_ell_af3d major_axis: float = void setMember major_axis

   Xgl_ell_af3d minor_axis = float getMember minor_axis
   Xgl_ell_af3d minor_axis: float = void setMember minor_axis

   Xgl_ell_af3d rot_angle = float getMember rot_angle
   Xgl_ell_af3d rot_angle: float = void setMember rot_angle

   Xgl_ell_af3d start_angle = float getMember start_angle
   Xgl_ell_af3d start_angle: float = void setMember start_angle

   Xgl_ell_af3d stop_angle = float getMember stop_angle
   Xgl_ell_af3d stop_angle: float = void setMember stop_angle

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_ell_af3d set_Center: Xgl_pt_flag_f3d \
	Major_axis: float \
	Minor_axis: float \
	Rot_angle: float \
	Start_angle: float \
	Stop_angle: float \
	 = void call xgl_ell_af3d_set


traits: traits xgl raw ellD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_ell_d3d {xgl ellD3d deadCopy} call xgl_ell_d3d_new
   Xgl_ell_d3d delete = void call xgl_ell_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilEllD3d = proxy_null Xgl_ell_d3d* Xgl_ell_d3d_seal {xgl ellD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_ell_d3d at: unsigned_int = proxy_null Xgl_ell_d3d* Xgl_ell_d3d_seal {xgl ellD3d deadCopy} call xgl_ell_d3d_at
   Xgl_ell_d3d at: unsigned_int Put: Xgl_ell_d3d = void call xgl_ell_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_ell_d3d center = Xgl_pt_flag_d3d {xgl ptFlagD3d deadCopy} call xgl_ell_d3d_center
   Xgl_ell_d3d center: Xgl_pt_flag_d3d = void call xgl_ell_d3d_center

   Xgl_ell_d3d dir = Xgl_pt_d3d {xgl ptD3d deadCopy} call xgl_ell_d3d_dir

   Xgl_ell_d3d dir_normal = bool getMember dir_normal
   Xgl_ell_d3d dir_normal: bool = void setMember dir_normal

   Xgl_ell_d3d dir_normalized = bool getMember dir_normalized
   Xgl_ell_d3d dir_normalized: bool = void setMember dir_normalized

   Xgl_ell_d3d major_axis = double getMember major_axis
   Xgl_ell_d3d major_axis: double = void setMember major_axis

   Xgl_ell_d3d minor_axis = double getMember minor_axis
   Xgl_ell_d3d minor_axis: double = void setMember minor_axis

   Xgl_ell_d3d rot_angle = double getMember rot_angle
   Xgl_ell_d3d rot_angle: double = void setMember rot_angle

   Xgl_ell_d3d start_angle = double getMember start_angle
   Xgl_ell_d3d start_angle: double = void setMember start_angle

   Xgl_ell_d3d stop_angle = double getMember stop_angle
   Xgl_ell_d3d stop_angle: double = void setMember stop_angle

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_ell_d3d set_Center: Xgl_pt_flag_d3d \
	Dir_normal: bool \
	Dir_normalized: bool \
	Major_axis: double \
	Minor_axis: double \
	Rot_angle: double \
	Start_angle: double \
	Stop_angle: double \
	 = void call xgl_ell_d3d_set


traits: traits xgl raw ellF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_ell_f3d {xgl ellF3d deadCopy} call xgl_ell_f3d_new
   Xgl_ell_f3d delete = void call xgl_ell_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilEllF3d = proxy_null Xgl_ell_f3d* Xgl_ell_f3d_seal {xgl ellF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_ell_f3d at: unsigned_int = proxy_null Xgl_ell_f3d* Xgl_ell_f3d_seal {xgl ellF3d deadCopy} call xgl_ell_f3d_at
   Xgl_ell_f3d at: unsigned_int Put: Xgl_ell_f3d = void call xgl_ell_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_ell_f3d center = Xgl_pt_flag_f3d {xgl ptFlagF3d deadCopy} call xgl_ell_f3d_center
   Xgl_ell_f3d center: Xgl_pt_flag_f3d = void call xgl_ell_f3d_center

   Xgl_ell_f3d dir = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_ell_f3d_dir

   Xgl_ell_f3d dir_normal = bool getMember dir_normal
   Xgl_ell_f3d dir_normal: bool = void setMember dir_normal

   Xgl_ell_f3d dir_normalized = bool getMember dir_normalized
   Xgl_ell_f3d dir_normalized: bool = void setMember dir_normalized

   Xgl_ell_f3d major_axis = float getMember major_axis
   Xgl_ell_f3d major_axis: float = void setMember major_axis

   Xgl_ell_f3d minor_axis = float getMember minor_axis
   Xgl_ell_f3d minor_axis: float = void setMember minor_axis

   Xgl_ell_f3d rot_angle = float getMember rot_angle
   Xgl_ell_f3d rot_angle: float = void setMember rot_angle

   Xgl_ell_f3d start_angle = float getMember start_angle
   Xgl_ell_f3d start_angle: float = void setMember start_angle

   Xgl_ell_f3d stop_angle = float getMember stop_angle
   Xgl_ell_f3d stop_angle: float = void setMember stop_angle

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_ell_f3d set_Center: Xgl_pt_flag_f3d \
	Dir_normal: bool \
	Dir_normalized: bool \
	Major_axis: float \
	Minor_axis: float \
	Rot_angle: float \
	Start_angle: float \
	Stop_angle: float \
	 = void call xgl_ell_f3d_set


traits: traits xgl raw ellList
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_ell_list {xgl ellList deadCopy} call xgl_ell_list_new
   Xgl_ell_list delete = void call xgl_ell_list_delete

  -- create nil proxy
  visibility: publicSlot
   void nilEllList = proxy_null Xgl_ell_list* Xgl_ell_list_seal {xgl ellList deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_ell_list at: unsigned_int = proxy_null Xgl_ell_list* Xgl_ell_list_seal {xgl ellList deadCopy} call xgl_ell_list_at
   Xgl_ell_list at: unsigned_int Put: Xgl_ell_list = void call xgl_ell_list_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_ell_list bbox = Xgl_bbox {xgl bbox deadCopy} getMember bbox
   Xgl_ell_list bbox: proxy_null Xgl_bbox* Xgl_bbox_seal = void setMember bbox

   Xgl_ell_list ells_ad3d = Xgl_ell_ad3d {xgl ellAd3d deadCopy} call xgl_ell_list_ells_ad3d
   Xgl_ell_list ells_ad3d: proxy_null Xgl_ell_ad3d* Xgl_ell_ad3d_seal = void call xgl_ell_list_ells_ad3d

   Xgl_ell_list ells_af3d = Xgl_ell_af3d {xgl ellAf3d deadCopy} call xgl_ell_list_ells_af3d
   Xgl_ell_list ells_af3d: proxy_null Xgl_ell_af3d* Xgl_ell_af3d_seal = void call xgl_ell_list_ells_af3d

   Xgl_ell_list ells_d3d = Xgl_ell_d3d {xgl ellD3d deadCopy} call xgl_ell_list_ells_d3d
   Xgl_ell_list ells_d3d: proxy_null Xgl_ell_d3d* Xgl_ell_d3d_seal = void call xgl_ell_list_ells_d3d

   Xgl_ell_list ells_f3d = Xgl_ell_f3d {xgl ellF3d deadCopy} call xgl_ell_list_ells_f3d
   Xgl_ell_list ells_f3d: proxy_null Xgl_ell_f3d* Xgl_ell_f3d_seal = void call xgl_ell_list_ells_f3d

   Xgl_ell_list num_ells = unsigned_long getMember num_ells
   Xgl_ell_list num_ells: unsigned_long = void setMember num_ells

   Xgl_ell_list type = any Xgl_multiell_type getMember type
   Xgl_ell_list type: any Xgl_multiell_type = void setMember type

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_ell_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Ells_ad3d: proxy_null Xgl_ell_ad3d* Xgl_ell_ad3d_seal \
	Num_ells: unsigned_long \
	Type: any Xgl_multiell_type \
	 = void call xgl_ell_list_set

   Xgl_ell_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Ells_af3d: proxy_null Xgl_ell_af3d* Xgl_ell_af3d_seal \
	Num_ells: unsigned_long \
	Type: any Xgl_multiell_type \
	 = void call xgl_ell_list_set

   Xgl_ell_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Ells_d3d: proxy_null Xgl_ell_d3d* Xgl_ell_d3d_seal \
	Num_ells: unsigned_long \
	Type: any Xgl_multiell_type \
	 = void call xgl_ell_list_set

   Xgl_ell_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Ells_f3d: proxy_null Xgl_ell_f3d* Xgl_ell_f3d_seal \
	Num_ells: unsigned_long \
	Type: any Xgl_multiell_type \
	 = void call xgl_ell_list_set


traits: traits xgl raw errorInfo
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_error_info {xgl errorInfo deadCopy} call xgl_error_info_new
   Xgl_error_info delete = void call xgl_error_info_delete

  -- create nil proxy
  visibility: publicSlot
   void nilErrorInfo = proxy_null Xgl_error_info* Xgl_error_info_seal {xgl errorInfo deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_error_info at: unsigned_int = proxy_null Xgl_error_info* Xgl_error_info_seal {xgl errorInfo deadCopy} call xgl_error_info_at
   Xgl_error_info at: unsigned_int Put: Xgl_error_info = void call xgl_error_info_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_error_info category = any Xgl_error_category getMember category
   Xgl_error_info category: any Xgl_error_category = void setMember category

   Xgl_error_info cur_obj = string getMember cur_obj
   Xgl_error_info cur_obj: string = void setMember cur_obj

   Xgl_error_info cur_op = string getMember cur_op
   Xgl_error_info cur_op: string = void setMember cur_op

   Xgl_error_info id = string getMember id
   Xgl_error_info id: string = void setMember id

   Xgl_error_info msg = string getMember msg
   Xgl_error_info msg: string = void setMember msg

   Xgl_error_info operand1 = string getMember operand1
   Xgl_error_info operand1: string = void setMember operand1

   Xgl_error_info operand2 = string getMember operand2
   Xgl_error_info operand2: string = void setMember operand2

   Xgl_error_info type = any Xgl_error_type getMember type
   Xgl_error_info type: any Xgl_error_type = void setMember type


traits: traits xgl raw facet
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_facet {xgl facet deadCopy} call xgl_facet_new
   Xgl_facet delete = void call xgl_facet_delete

  -- create nil proxy
  visibility: publicSlot
   void nilFacet = proxy_null Xgl_facet* Xgl_facet_seal {xgl facet deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_facet at: unsigned_int = proxy_null Xgl_facet* Xgl_facet_seal {xgl facet deadCopy} call xgl_facet_at
   Xgl_facet at: unsigned_int Put: Xgl_facet = void call xgl_facet_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_facet color_facet = Xgl_color_facet {xgl colorFacet deadCopy} call xgl_facet_color_facet
   Xgl_facet color_facet: Xgl_color_facet = void call xgl_facet_color_facet

   Xgl_facet color_normal_facet = Xgl_color_normal_facet {xgl colorNormalFacet deadCopy} call xgl_facet_color_normal_facet
   Xgl_facet color_normal_facet: Xgl_color_normal_facet = void call xgl_facet_color_normal_facet

   Xgl_facet normal_facet = Xgl_normal_facet {xgl normalFacet deadCopy} call xgl_facet_normal_facet
   Xgl_facet normal_facet: Xgl_normal_facet = void call xgl_facet_normal_facet


traits: traits xgl raw facetList
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_facet_list {xgl facetList deadCopy} call xgl_facet_list_new
   Xgl_facet_list delete = void call xgl_facet_list_delete

  -- create nil proxy
  visibility: publicSlot
   void nilFacetList = proxy_null Xgl_facet_list* Xgl_facet_list_seal {xgl facetList deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_facet_list at: unsigned_int = proxy_null Xgl_facet_list* Xgl_facet_list_seal {xgl facetList deadCopy} call xgl_facet_list_at
   Xgl_facet_list at: unsigned_int Put: Xgl_facet_list = void call xgl_facet_list_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_facet_list facet_type = any Xgl_facet_type getMember facet_type
   Xgl_facet_list facet_type: any Xgl_facet_type = void setMember facet_type

   Xgl_facet_list facets_color_facets = Xgl_color_facet {xgl colorFacet deadCopy} call xgl_facet_list_facets_color_facets
   Xgl_facet_list facets_color_facets: proxy_null Xgl_color_facet* Xgl_color_facet_seal = void call xgl_facet_list_facets_color_facets

   Xgl_facet_list facets_color_normal_facets = Xgl_color_normal_facet {xgl colorNormalFacet deadCopy} call xgl_facet_list_facets_color_normal_facets
   Xgl_facet_list facets_color_normal_facets: proxy_null Xgl_color_normal_facet* Xgl_color_normal_facet_seal = void call xgl_facet_list_facets_color_normal_facets

   Xgl_facet_list facets_normal_facets = Xgl_normal_facet {xgl normalFacet deadCopy} call xgl_facet_list_facets_normal_facets
   Xgl_facet_list facets_normal_facets: proxy_null Xgl_normal_facet* Xgl_normal_facet_seal = void call xgl_facet_list_facets_normal_facets

   Xgl_facet_list num_facets = unsigned_long getMember num_facets
   Xgl_facet_list num_facets: unsigned_long = void setMember num_facets

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_facet_list set_Facet_type: any Xgl_facet_type \
	Facets_color_facets: proxy_null Xgl_color_facet* Xgl_color_facet_seal \
	Num_facets: unsigned_long \
	 = void call xgl_facet_list_set

   Xgl_facet_list set_Facet_type: any Xgl_facet_type \
	Facets_color_normal_facets: proxy_null Xgl_color_normal_facet* Xgl_color_normal_facet_seal \
	Num_facets: unsigned_long \
	 = void call xgl_facet_list_set

   Xgl_facet_list set_Facet_type: any Xgl_facet_type \
	Facets_normal_facets: proxy_null Xgl_normal_facet* Xgl_normal_facet_seal \
	Num_facets: unsigned_long \
	 = void call xgl_facet_list_set


traits: traits xgl raw facetListList
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_facet_list_list {xgl facetListList deadCopy} call xgl_facet_list_list_new
   Xgl_facet_list_list delete = void call xgl_facet_list_list_delete

  -- create nil proxy
  visibility: publicSlot
   void nilFacetListList = proxy_null Xgl_facet_list_list* Xgl_facet_list_list_seal {xgl facetListList deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_facet_list_list at: unsigned_int = proxy_null Xgl_facet_list_list* Xgl_facet_list_list_seal {xgl facetListList deadCopy} call xgl_facet_list_list_at
   Xgl_facet_list_list at: unsigned_int Put: Xgl_facet_list_list = void call xgl_facet_list_list_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_facet_list_list facet_lists = Xgl_facet_list {xgl facetList deadCopy} getMember facet_lists
   Xgl_facet_list_list facet_lists: proxy_null Xgl_facet_list* Xgl_facet_list_seal = void setMember facet_lists

   Xgl_facet_list_list num_facet_lists = unsigned_long getMember num_facet_lists
   Xgl_facet_list_list num_facet_lists: unsigned_long = void setMember num_facet_lists


traits: traits xgl raw inquire
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_inquire {xgl inquire deadCopy} call xgl_inquire_new
   Xgl_inquire delete = void call xgl_inquire_delete

  -- create nil proxy
  visibility: publicSlot
   void nilInquire = proxy_null Xgl_inquire* Xgl_inquire_seal {xgl inquire deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_inquire at: unsigned_int = proxy_null Xgl_inquire* Xgl_inquire_seal {xgl inquire deadCopy} call xgl_inquire_at
   Xgl_inquire at: unsigned_int Put: Xgl_inquire = void call xgl_inquire_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_inquire antialiasing = any Xgl_inq_support_level getMember antialiasing
   Xgl_inquire antialiasing: any Xgl_inq_support_level = void setMember antialiasing

   Xgl_inquire color_type = Xgl_color_type_supported {xgl colorTypeSupported deadCopy} call xgl_inquire_color_type
   Xgl_inquire color_type: Xgl_color_type_supported = void call xgl_inquire_color_type

   Xgl_inquire db_buffer_is_copy = bool getMember db_buffer_is_copy
   Xgl_inquire db_buffer_is_copy: bool = void setMember db_buffer_is_copy

   Xgl_inquire depth = long getMember depth
   Xgl_inquire depth: long = void setMember depth

   Xgl_inquire depth_cueing = any Xgl_inq_support_level getMember depth_cueing
   Xgl_inquire depth_cueing: any Xgl_inq_support_level = void setMember depth_cueing

   Xgl_inquire dga_flag = bool getMember dga_flag
   Xgl_inquire dga_flag: bool = void setMember dga_flag

   Xgl_inquire double_buffer = any Xgl_inq_support_level getMember double_buffer
   Xgl_inquire double_buffer: any Xgl_inq_support_level = void setMember double_buffer

   Xgl_inquire height = long getMember height
   Xgl_inquire height: long = void setMember height

   Xgl_inquire hlhsr = any Xgl_inq_support_level getMember hlhsr
   Xgl_inquire hlhsr: any Xgl_inq_support_level = void setMember hlhsr

   Xgl_inquire hlhsr_mode = any Xgl_hlhsr_mode getMember hlhsr_mode
   Xgl_inquire hlhsr_mode: any Xgl_hlhsr_mode = void setMember hlhsr_mode

   Xgl_inquire indexed_color = any Xgl_inq_support_level getMember indexed_color
   Xgl_inquire indexed_color: any Xgl_inq_support_level = void setMember indexed_color

   Xgl_inquire lighting = any Xgl_inq_support_level getMember lighting
   Xgl_inquire lighting: any Xgl_inq_support_level = void setMember lighting

   Xgl_inquire maximum_buffer = long getMember maximum_buffer
   Xgl_inquire maximum_buffer: long = void setMember maximum_buffer

   Xgl_inquire name = string getMember name
   Xgl_inquire name: string = void setMember name

   Xgl_inquire picking = any Xgl_inq_support_level getMember picking
   Xgl_inquire picking: any Xgl_inq_support_level = void setMember picking

   Xgl_inquire pt_type = Xgl_pt_type_supported {xgl ptTypeSupported deadCopy} call xgl_inquire_pt_type
   Xgl_inquire pt_type: Xgl_pt_type_supported = void call xgl_inquire_pt_type

   Xgl_inquire shading = any Xgl_inq_support_level getMember shading
   Xgl_inquire shading: any Xgl_inq_support_level = void setMember shading

   Xgl_inquire stereo = bool getMember stereo
   Xgl_inquire stereo: bool = void setMember stereo

   Xgl_inquire true_color = any Xgl_inq_support_level getMember true_color
   Xgl_inquire true_color: any Xgl_inq_support_level = void setMember true_color

   Xgl_inquire width = long getMember width
   Xgl_inquire width: long = void setMember width


traits: traits xgl raw irect
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_irect {xgl irect deadCopy} call xgl_irect_new
   Xgl_irect delete = void call xgl_irect_delete

  -- create nil proxy
  visibility: publicSlot
   void nilIrect = proxy_null Xgl_irect* Xgl_irect_seal {xgl irect deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_irect at: unsigned_int = proxy_null Xgl_irect* Xgl_irect_seal {xgl irect deadCopy} call xgl_irect_at
   Xgl_irect at: unsigned_int Put: Xgl_irect = void call xgl_irect_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_irect xmax = long getMember xmax
   Xgl_irect xmax: long = void setMember xmax

   Xgl_irect xmin = long getMember xmin
   Xgl_irect xmin: long = void setMember xmin

   Xgl_irect ymax = long getMember ymax
   Xgl_irect ymax: long = void setMember ymax

   Xgl_irect ymin = long getMember ymin
   Xgl_irect ymin: long = void setMember ymin

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_irect set_Xmax: long \
	Xmin: long \
	Ymax: long \
	Ymin: long \
	 = void call xgl_irect_set


traits: traits xgl raw irectList
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_irect_list {xgl irectList deadCopy} call xgl_irect_list_new
   Xgl_irect_list delete = void call xgl_irect_list_delete

  -- create nil proxy
  visibility: publicSlot
   void nilIrectList = proxy_null Xgl_irect_list* Xgl_irect_list_seal {xgl irectList deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_irect_list at: unsigned_int = proxy_null Xgl_irect_list* Xgl_irect_list_seal {xgl irectList deadCopy} call xgl_irect_list_at
   Xgl_irect_list at: unsigned_int Put: Xgl_irect_list = void call xgl_irect_list_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_irect_list num_irects = unsigned_long getMember num_irects
   Xgl_irect_list num_irects: unsigned_long = void setMember num_irects

   Xgl_irect_list rects = Xgl_irect {xgl irect deadCopy} getMember rects
   Xgl_irect_list rects: proxy_null Xgl_irect* Xgl_irect_seal = void setMember rects


traits: traits xgl raw matrixD2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_matrix_d2d {xgl matrixD2d deadCopy} call xgl_matrix_d2d_new
   Xgl_matrix_d2d delete = void call xgl_matrix_d2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilMatrixD2d = proxy_null Xgl_matrix_d2d* Xgl_matrix_d2d_seal {xgl matrixD2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_matrix_d2d at: unsigned_int = proxy_null Xgl_matrix_d2d* Xgl_matrix_d2d_seal {xgl matrixD2d deadCopy} call xgl_matrix_d2d_at
   Xgl_matrix_d2d at: unsigned_int Put: Xgl_matrix_d2d = void call xgl_matrix_d2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_matrix_d2d row: unsigned_int Column: unsigned_int = double call xgl_matrix_d2d_row_column
   Xgl_matrix_d2d row: unsigned_int Column: unsigned_int Put: double = void call xgl_matrix_d2d_row_column_put


traits: traits xgl raw matrixD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_matrix_d3d {xgl matrixD3d deadCopy} call xgl_matrix_d3d_new
   Xgl_matrix_d3d delete = void call xgl_matrix_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilMatrixD3d = proxy_null Xgl_matrix_d3d* Xgl_matrix_d3d_seal {xgl matrixD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_matrix_d3d at: unsigned_int = proxy_null Xgl_matrix_d3d* Xgl_matrix_d3d_seal {xgl matrixD3d deadCopy} call xgl_matrix_d3d_at
   Xgl_matrix_d3d at: unsigned_int Put: Xgl_matrix_d3d = void call xgl_matrix_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_matrix_d3d row: unsigned_int Column: unsigned_int = double call xgl_matrix_d3d_row_column
   Xgl_matrix_d3d row: unsigned_int Column: unsigned_int Put: double = void call xgl_matrix_d3d_row_column_put


traits: traits xgl raw matrixF2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_matrix_f2d {xgl matrixF2d deadCopy} call xgl_matrix_f2d_new
   Xgl_matrix_f2d delete = void call xgl_matrix_f2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilMatrixF2d = proxy_null Xgl_matrix_f2d* Xgl_matrix_f2d_seal {xgl matrixF2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_matrix_f2d at: unsigned_int = proxy_null Xgl_matrix_f2d* Xgl_matrix_f2d_seal {xgl matrixF2d deadCopy} call xgl_matrix_f2d_at
   Xgl_matrix_f2d at: unsigned_int Put: Xgl_matrix_f2d = void call xgl_matrix_f2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_matrix_f2d row: unsigned_int Column: unsigned_int = float call xgl_matrix_f2d_row_column
   Xgl_matrix_f2d row: unsigned_int Column: unsigned_int Put: float = void call xgl_matrix_f2d_row_column_put


traits: traits xgl raw matrixF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_matrix_f3d {xgl matrixF3d deadCopy} call xgl_matrix_f3d_new
   Xgl_matrix_f3d delete = void call xgl_matrix_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilMatrixF3d = proxy_null Xgl_matrix_f3d* Xgl_matrix_f3d_seal {xgl matrixF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_matrix_f3d at: unsigned_int = proxy_null Xgl_matrix_f3d* Xgl_matrix_f3d_seal {xgl matrixF3d deadCopy} call xgl_matrix_f3d_at
   Xgl_matrix_f3d at: unsigned_int Put: Xgl_matrix_f3d = void call xgl_matrix_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_matrix_f3d row: unsigned_int Column: unsigned_int = float call xgl_matrix_f3d_row_column
   Xgl_matrix_f3d row: unsigned_int Column: unsigned_int Put: float = void call xgl_matrix_f3d_row_column_put


traits: traits xgl raw matrixI2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_matrix_i2d {xgl matrixI2d deadCopy} call xgl_matrix_i2d_new
   Xgl_matrix_i2d delete = void call xgl_matrix_i2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilMatrixI2d = proxy_null Xgl_matrix_i2d* Xgl_matrix_i2d_seal {xgl matrixI2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_matrix_i2d at: unsigned_int = proxy_null Xgl_matrix_i2d* Xgl_matrix_i2d_seal {xgl matrixI2d deadCopy} call xgl_matrix_i2d_at
   Xgl_matrix_i2d at: unsigned_int Put: Xgl_matrix_i2d = void call xgl_matrix_i2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_matrix_i2d row: unsigned_int Column: unsigned_int = long call xgl_matrix_i2d_row_column
   Xgl_matrix_i2d row: unsigned_int Column: unsigned_int Put: long = void call xgl_matrix_i2d_row_column_put


traits: traits xgl raw monoText
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_mono_text {xgl monoText deadCopy} call xgl_mono_text_new
   Xgl_mono_text delete = void call xgl_mono_text_delete

  -- create nil proxy
  visibility: publicSlot
   void nilMonoText = proxy_null Xgl_mono_text* Xgl_mono_text_seal {xgl monoText deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_mono_text at: unsigned_int = proxy_null Xgl_mono_text* Xgl_mono_text_seal {xgl monoText deadCopy} call xgl_mono_text_at
   Xgl_mono_text at: unsigned_int Put: Xgl_mono_text = void call xgl_mono_text_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_mono_text font_obj = Xgl_object_obj {xgl genericObject deadCopy} getMember font_obj
   Xgl_mono_text font_obj: Xgl_object_obj = void setMember font_obj

   Xgl_mono_text text = string getMember text
   Xgl_mono_text text: string = void setMember text


traits: traits xgl raw monoTextList
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_mono_text_list {xgl monoTextList deadCopy} call xgl_mono_text_list_new
   Xgl_mono_text_list delete = void call xgl_mono_text_list_delete

  -- create nil proxy
  visibility: publicSlot
   void nilMonoTextList = proxy_null Xgl_mono_text_list* Xgl_mono_text_list_seal {xgl monoTextList deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_mono_text_list at: unsigned_int = proxy_null Xgl_mono_text_list* Xgl_mono_text_list_seal {xgl monoTextList deadCopy} call xgl_mono_text_list_at
   Xgl_mono_text_list at: unsigned_int Put: Xgl_mono_text_list = void call xgl_mono_text_list_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_mono_text_list mono_list = Xgl_mono_text {xgl monoText deadCopy} getMember mono_list
   Xgl_mono_text_list mono_list: proxy_null Xgl_mono_text* Xgl_mono_text_seal = void setMember mono_list

   Xgl_mono_text_list mono_num = unsigned_long getMember mono_num
   Xgl_mono_text_list mono_num: unsigned_long = void setMember mono_num


traits: traits xgl raw normalFacet
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_normal_facet {xgl normalFacet deadCopy} call xgl_normal_facet_new
   Xgl_normal_facet delete = void call xgl_normal_facet_delete

  -- create nil proxy
  visibility: publicSlot
   void nilNormalFacet = proxy_null Xgl_normal_facet* Xgl_normal_facet_seal {xgl normalFacet deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_normal_facet at: unsigned_int = proxy_null Xgl_normal_facet* Xgl_normal_facet_seal {xgl normalFacet deadCopy} call xgl_normal_facet_at
   Xgl_normal_facet at: unsigned_int Put: Xgl_normal_facet = void call xgl_normal_facet_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_normal_facet normal = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_normal_facet_normal
   Xgl_normal_facet normal: Xgl_pt_f3d = void call xgl_normal_facet_normal

','

traits: traits xgl raw nuBsplineCurve
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_nu_bspline_curve {xgl nuBsplineCurve deadCopy} call xgl_nu_bspline_curve_new
   Xgl_nu_bspline_curve delete = void call xgl_nu_bspline_curve_delete

  -- create nil proxy
  visibility: publicSlot
   void nilNuBsplineCurve = proxy_null Xgl_nu_bspline_curve* Xgl_nu_bspline_curve_seal {xgl nuBsplineCurve deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_nu_bspline_curve at: unsigned_int = proxy_null Xgl_nu_bspline_curve* Xgl_nu_bspline_curve_seal {xgl nuBsplineCurve deadCopy} call xgl_nu_bspline_curve_at
   Xgl_nu_bspline_curve at: unsigned_int Put: Xgl_nu_bspline_curve = void call xgl_nu_bspline_curve_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_nu_bspline_curve ctrl_pts = Xgl_pt_list {xgl ptList deadCopy} call xgl_nu_bspline_curve_ctrl_pts
   Xgl_nu_bspline_curve ctrl_pts: Xgl_pt_list = void call xgl_nu_bspline_curve_ctrl_pts

   Xgl_nu_bspline_curve knot_vector = Float_vec_proxy {xgl floatVecProxy deadCopy} getMember knot_vector
   Xgl_nu_bspline_curve knot_vector: Float_vec_proxy = void setMember knot_vector

   Xgl_nu_bspline_curve num_knots = unsigned_long getMember num_knots
   Xgl_nu_bspline_curve num_knots: unsigned_long = void setMember num_knots

   Xgl_nu_bspline_curve order = unsigned_long getMember order
   Xgl_nu_bspline_curve order: unsigned_long = void setMember order

   Xgl_nu_bspline_curve range = Xgl_bounds_f1d {xgl boundsF1d deadCopy} call xgl_nu_bspline_curve_range
   Xgl_nu_bspline_curve range: Xgl_bounds_f1d = void call xgl_nu_bspline_curve_range

   Xgl_nu_bspline_curve trim_curve_vis = bool getMember trim_curve_vis
   Xgl_nu_bspline_curve trim_curve_vis: bool = void setMember trim_curve_vis

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_nu_bspline_curve set_Ctrl_pts: Xgl_pt_list \
	Knot_vector: any float* \
	Num_knots: unsigned_long \
	Order: unsigned_long \
	Range: Xgl_bounds_f1d \
	Trim_curve_vis: bool \
	 = void call xgl_nu_bspline_curve_set


traits: traits xgl raw nurbsCurve
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_nurbs_curve {xgl nurbsCurve deadCopy} call xgl_nurbs_curve_new
   Xgl_nurbs_curve delete = void call xgl_nurbs_curve_delete

  -- create nil proxy
  visibility: publicSlot
   void nilNurbsCurve = proxy_null Xgl_nurbs_curve* Xgl_nurbs_curve_seal {xgl nurbsCurve deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_nurbs_curve at: unsigned_int = proxy_null Xgl_nurbs_curve* Xgl_nurbs_curve_seal {xgl nurbsCurve deadCopy} call xgl_nurbs_curve_at
   Xgl_nurbs_curve at: unsigned_int Put: Xgl_nurbs_curve = void call xgl_nurbs_curve_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_nurbs_curve ctrl_pts = Xgl_pt_list {xgl ptList deadCopy} call xgl_nurbs_curve_ctrl_pts
   Xgl_nurbs_curve ctrl_pts: Xgl_pt_list = void call xgl_nurbs_curve_ctrl_pts

   Xgl_nurbs_curve knot_vector = Float_vec_proxy {xgl floatVecProxy deadCopy} getMember knot_vector
   Xgl_nurbs_curve knot_vector: Float_vec_proxy = void setMember knot_vector

   Xgl_nurbs_curve num_knots = unsigned_long getMember num_knots
   Xgl_nurbs_curve num_knots: unsigned_long = void setMember num_knots

   Xgl_nurbs_curve order = unsigned_long getMember order
   Xgl_nurbs_curve order: unsigned_long = void setMember order

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_nurbs_curve set_Ctrl_pts: Xgl_pt_list \
	Knot_vector: any float* \
	Num_knots: unsigned_long \
	Order: unsigned_long \
	 = void call xgl_nurbs_curve_set


traits: traits xgl raw nurbsSurf
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_nurbs_surf {xgl nurbsSurf deadCopy} call xgl_nurbs_surf_new
   Xgl_nurbs_surf delete = void call xgl_nurbs_surf_delete

  -- create nil proxy
  visibility: publicSlot
   void nilNurbsSurf = proxy_null Xgl_nurbs_surf* Xgl_nurbs_surf_seal {xgl nurbsSurf deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_nurbs_surf at: unsigned_int = proxy_null Xgl_nurbs_surf* Xgl_nurbs_surf_seal {xgl nurbsSurf deadCopy} call xgl_nurbs_surf_at
   Xgl_nurbs_surf at: unsigned_int Put: Xgl_nurbs_surf = void call xgl_nurbs_surf_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_nurbs_surf ctrl_pts = Xgl_pt_list {xgl ptList deadCopy} call xgl_nurbs_surf_ctrl_pts
   Xgl_nurbs_surf ctrl_pts: Xgl_pt_list = void call xgl_nurbs_surf_ctrl_pts

   Xgl_nurbs_surf knot_vector_u = Float_vec_proxy {xgl floatVecProxy deadCopy} getMember knot_vector_u
   Xgl_nurbs_surf knot_vector_u: Float_vec_proxy = void setMember knot_vector_u

   Xgl_nurbs_surf knot_vector_v = Float_vec_proxy {xgl floatVecProxy deadCopy} getMember knot_vector_v
   Xgl_nurbs_surf knot_vector_v: Float_vec_proxy = void setMember knot_vector_v

   Xgl_nurbs_surf num_knots_u = unsigned_long getMember num_knots_u
   Xgl_nurbs_surf num_knots_u: unsigned_long = void setMember num_knots_u

   Xgl_nurbs_surf num_knots_v = unsigned_long getMember num_knots_v
   Xgl_nurbs_surf num_knots_v: unsigned_long = void setMember num_knots_v

   Xgl_nurbs_surf order_u = unsigned_long getMember order_u
   Xgl_nurbs_surf order_u: unsigned_long = void setMember order_u

   Xgl_nurbs_surf order_v = unsigned_long getMember order_v
   Xgl_nurbs_surf order_v: unsigned_long = void setMember order_v

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_nurbs_surf set_Ctrl_pts: Xgl_pt_list \
	Knot_vector_u: any float* \
	Knot_vector_v: any float* \
	Num_knots_u: unsigned_long \
	Num_knots_v: unsigned_long \
	Order_u: unsigned_long \
	Order_v: unsigned_long \
	 = void call xgl_nurbs_surf_set


traits: traits xgl raw nurbsSurfSimpleGeom
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_nurbs_surf_simple_geom {xgl nurbsSurfSimpleGeom deadCopy} call xgl_nurbs_surf_simple_geom_new
   Xgl_nurbs_surf_simple_geom delete = void call xgl_nurbs_surf_simple_geom_delete

  -- create nil proxy
  visibility: publicSlot
   void nilNurbsSurfSimpleGeom = proxy_null Xgl_nurbs_surf_simple_geom* Xgl_nurbs_surf_simple_geom_seal {xgl nurbsSurfSimpleGeom deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_nurbs_surf_simple_geom at: unsigned_int = proxy_null Xgl_nurbs_surf_simple_geom* Xgl_nurbs_surf_simple_geom_seal {xgl nurbsSurfSimpleGeom deadCopy} call xgl_nurbs_surf_simple_geom_at
   Xgl_nurbs_surf_simple_geom at: unsigned_int Put: Xgl_nurbs_surf_simple_geom = void call xgl_nurbs_surf_simple_geom_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_nurbs_surf_simple_geom geom_desc_conical_apex = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_nurbs_surf_simple_geom_geom_desc_conical_apex
   Xgl_nurbs_surf_simple_geom geom_desc_conical_apex: Xgl_pt_f3d = void call xgl_nurbs_surf_simple_geom_geom_desc_conical_apex

   Xgl_nurbs_surf_simple_geom geom_desc_conical_axis_dir = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_nurbs_surf_simple_geom_geom_desc_conical_axis_dir
   Xgl_nurbs_surf_simple_geom geom_desc_conical_axis_dir: Xgl_pt_f3d = void call xgl_nurbs_surf_simple_geom_geom_desc_conical_axis_dir

   Xgl_nurbs_surf_simple_geom geom_desc_conical_cone_angle = float call xgl_nurbs_surf_simple_geom_geom_desc_conical_cone_angle
   Xgl_nurbs_surf_simple_geom geom_desc_conical_cone_angle: float = void call xgl_nurbs_surf_simple_geom_geom_desc_conical_cone_angle

   Xgl_nurbs_surf_simple_geom geom_desc_conical_norm_flag = bool call xgl_nurbs_surf_simple_geom_geom_desc_conical_norm_flag
   Xgl_nurbs_surf_simple_geom geom_desc_conical_norm_flag: bool = void call xgl_nurbs_surf_simple_geom_geom_desc_conical_norm_flag

   Xgl_nurbs_surf_simple_geom geom_desc_cylindrical_axial_pt = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_nurbs_surf_simple_geom_geom_desc_cylindrical_axial_pt
   Xgl_nurbs_surf_simple_geom geom_desc_cylindrical_axial_pt: Xgl_pt_f3d = void call xgl_nurbs_surf_simple_geom_geom_desc_cylindrical_axial_pt

   Xgl_nurbs_surf_simple_geom geom_desc_cylindrical_axis_dir = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_nurbs_surf_simple_geom_geom_desc_cylindrical_axis_dir
   Xgl_nurbs_surf_simple_geom geom_desc_cylindrical_axis_dir: Xgl_pt_f3d = void call xgl_nurbs_surf_simple_geom_geom_desc_cylindrical_axis_dir

   Xgl_nurbs_surf_simple_geom geom_desc_cylindrical_norm_flag = bool call xgl_nurbs_surf_simple_geom_geom_desc_cylindrical_norm_flag
   Xgl_nurbs_surf_simple_geom geom_desc_cylindrical_norm_flag: bool = void call xgl_nurbs_surf_simple_geom_geom_desc_cylindrical_norm_flag

   Xgl_nurbs_surf_simple_geom geom_desc_cylindrical_radius = float call xgl_nurbs_surf_simple_geom_geom_desc_cylindrical_radius
   Xgl_nurbs_surf_simple_geom geom_desc_cylindrical_radius: float = void call xgl_nurbs_surf_simple_geom_geom_desc_cylindrical_radius

   Xgl_nurbs_surf_simple_geom geom_desc_planar = Xgl_plane {xgl plane deadCopy} call xgl_nurbs_surf_simple_geom_geom_desc_planar
   Xgl_nurbs_surf_simple_geom geom_desc_planar: Xgl_plane = void call xgl_nurbs_surf_simple_geom_geom_desc_planar

   Xgl_nurbs_surf_simple_geom geom_desc_spherical_center = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_nurbs_surf_simple_geom_geom_desc_spherical_center
   Xgl_nurbs_surf_simple_geom geom_desc_spherical_center: Xgl_pt_f3d = void call xgl_nurbs_surf_simple_geom_geom_desc_spherical_center

   Xgl_nurbs_surf_simple_geom geom_desc_spherical_norm_flag = bool call xgl_nurbs_surf_simple_geom_geom_desc_spherical_norm_flag
   Xgl_nurbs_surf_simple_geom geom_desc_spherical_norm_flag: bool = void call xgl_nurbs_surf_simple_geom_geom_desc_spherical_norm_flag

   Xgl_nurbs_surf_simple_geom geom_desc_spherical_radius = float call xgl_nurbs_surf_simple_geom_geom_desc_spherical_radius
   Xgl_nurbs_surf_simple_geom geom_desc_spherical_radius: float = void call xgl_nurbs_surf_simple_geom_geom_desc_spherical_radius

   Xgl_nurbs_surf_simple_geom surf_type = any Xgl_nurbs_surf_type getMember surf_type
   Xgl_nurbs_surf_simple_geom surf_type: any Xgl_nurbs_surf_type = void setMember surf_type

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_nurbs_surf_simple_geom set_Geom_desc_conical_apex: Xgl_pt_f3d \
	Geom_desc_conical_axis_dir: Xgl_pt_f3d \
	Geom_desc_conical_cone_angle: float \
	Geom_desc_conical_norm_flag: bool \
	Surf_type: any Xgl_nurbs_surf_type \
	 = void call xgl_nurbs_surf_simple_geom_set

   Xgl_nurbs_surf_simple_geom set_Geom_desc_cylindrical_axial_pt: Xgl_pt_f3d \
	Geom_desc_cylindrical_axis_dir: Xgl_pt_f3d \
	Geom_desc_cylindrical_norm_flag: bool \
	Geom_desc_cylindrical_radius: float \
	Surf_type: any Xgl_nurbs_surf_type \
	 = void call xgl_nurbs_surf_simple_geom_set

   Xgl_nurbs_surf_simple_geom set_Geom_desc_planar: Xgl_plane \
	Surf_type: any Xgl_nurbs_surf_type \
	 = void call xgl_nurbs_surf_simple_geom_set

   Xgl_nurbs_surf_simple_geom set_Geom_desc_spherical_center: Xgl_pt_f3d \
	Geom_desc_spherical_norm_flag: bool \
	Geom_desc_spherical_radius: float \
	Surf_type: any Xgl_nurbs_surf_type \
	 = void call xgl_nurbs_surf_simple_geom_set


traits: traits xgl raw objDesc
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_obj_desc {xgl objDesc deadCopy} call xgl_obj_desc_new
   Xgl_obj_desc delete = void call xgl_obj_desc_delete

  -- create nil proxy
  visibility: publicSlot
   void nilObjDesc = proxy_null Xgl_obj_desc* Xgl_obj_desc_seal {xgl objDesc deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_obj_desc at: unsigned_int = proxy_null Xgl_obj_desc* Xgl_obj_desc_seal {xgl objDesc deadCopy} call xgl_obj_desc_at
   Xgl_obj_desc at: unsigned_int Put: Xgl_obj_desc = void call xgl_obj_desc_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_obj_desc accum_buf_raster = Xgl_object_obj {xgl genericObject deadCopy} call xgl_obj_desc_accum_buf_raster
   Xgl_obj_desc accum_buf_raster: Xgl_object_obj = void call xgl_obj_desc_accum_buf_raster

   Xgl_obj_desc sfont_name = string getMember sfont_name
   Xgl_obj_desc sfont_name: string = void setMember sfont_name

   Xgl_obj_desc stream_desc = proxy void* Xgl_stream_info_seal {xgl streamInfo deadCopy} call xgl_obj_desc_stream_desc
   Xgl_obj_desc stream_desc: proxy void* Xgl_stream_info_seal = void call xgl_obj_desc_stream_desc

   Xgl_obj_desc stream_name = string call xgl_obj_desc_stream_name
   Xgl_obj_desc stream_name: string = void call xgl_obj_desc_stream_name

   Xgl_obj_desc win_ras_desc = proxy void* Xgl_X_window_seal {xgl xWindow deadCopy} call xgl_obj_desc_win_ras_desc
   Xgl_obj_desc win_ras_desc: proxy void* Xgl_X_window_seal = void call xgl_obj_desc_win_ras_desc

   Xgl_obj_desc win_ras_type = any Xgl_window_type call xgl_obj_desc_win_ras_type
   Xgl_obj_desc win_ras_type: any Xgl_window_type = void call xgl_obj_desc_win_ras_type


traits: traits xgl raw pickInfo
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pick_info {xgl pickInfo deadCopy} call xgl_pick_info_new
   Xgl_pick_info delete = void call xgl_pick_info_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPickInfo = proxy_null Xgl_pick_info* Xgl_pick_info_seal {xgl pickInfo deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pick_info at: unsigned_int = proxy_null Xgl_pick_info* Xgl_pick_info_seal {xgl pickInfo deadCopy} call xgl_pick_info_at
   Xgl_pick_info at: unsigned_int Put: Xgl_pick_info = void call xgl_pick_info_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pick_info id1 = unsigned_long getMember id1
   Xgl_pick_info id1: unsigned_long = void setMember id1

   Xgl_pick_info id2 = unsigned_long getMember id2
   Xgl_pick_info id2: unsigned_long = void setMember id2

   Xgl_pick_info vertex_flag = unsigned_long getMember vertex_flag
   Xgl_pick_info vertex_flag: unsigned_long = void setMember vertex_flag

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pick_info set_Id1: unsigned_long \
	Id2: unsigned_long \
	Vertex_flag: unsigned_long \
	 = void call xgl_pick_info_set


traits: traits xgl raw plane
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_plane {xgl plane deadCopy} call xgl_plane_new
   Xgl_plane delete = void call xgl_plane_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPlane = proxy_null Xgl_plane* Xgl_plane_seal {xgl plane deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_plane at: unsigned_int = proxy_null Xgl_plane* Xgl_plane_seal {xgl plane deadCopy} call xgl_plane_at
   Xgl_plane at: unsigned_int Put: Xgl_plane = void call xgl_plane_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_plane normal = Xgl_pt_d3d {xgl ptD3d deadCopy} call xgl_plane_normal
   Xgl_plane normal: Xgl_pt_d3d = void call xgl_plane_normal

   Xgl_plane pt = Xgl_pt_d3d {xgl ptD3d deadCopy} call xgl_plane_pt
   Xgl_plane pt: Xgl_pt_d3d = void call xgl_plane_pt


traits: traits xgl raw planeList
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_plane_list {xgl planeList deadCopy} call xgl_plane_list_new
   Xgl_plane_list delete = void call xgl_plane_list_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPlaneList = proxy_null Xgl_plane_list* Xgl_plane_list_seal {xgl planeList deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_plane_list at: unsigned_int = proxy_null Xgl_plane_list* Xgl_plane_list_seal {xgl planeList deadCopy} call xgl_plane_list_at
   Xgl_plane_list at: unsigned_int Put: Xgl_plane_list = void call xgl_plane_list_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_plane_list num_planes = unsigned_long getMember num_planes
   Xgl_plane_list num_planes: unsigned_long = void setMember num_planes

   Xgl_plane_list planes = Xgl_plane {xgl plane deadCopy} getMember planes
   Xgl_plane_list planes: proxy_null Xgl_plane* Xgl_plane_seal = void setMember planes


traits: traits xgl raw pt
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt {xgl pt deadCopy} call xgl_pt_new
   Xgl_pt delete = void call xgl_pt_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPt = proxy_null Xgl_pt* Xgl_pt_seal {xgl pt deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt at: unsigned_int = proxy_null Xgl_pt* Xgl_pt_seal {xgl pt deadCopy} call xgl_pt_at
   Xgl_pt at: unsigned_int Put: Xgl_pt = void call xgl_pt_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt pt_d2d = Xgl_pt_d2d {xgl ptD2d deadCopy} call xgl_pt_pt_d2d
   Xgl_pt pt_d2d: proxy_null Xgl_pt_d2d* Xgl_pt_d2d_seal = void call xgl_pt_pt_d2d

   Xgl_pt pt_d3d = Xgl_pt_d3d {xgl ptD3d deadCopy} call xgl_pt_pt_d3d
   Xgl_pt pt_d3d: proxy_null Xgl_pt_d3d* Xgl_pt_d3d_seal = void call xgl_pt_pt_d3d

   Xgl_pt pt_f2d = Xgl_pt_f2d {xgl ptF2d deadCopy} call xgl_pt_pt_f2d
   Xgl_pt pt_f2d: proxy_null Xgl_pt_f2d* Xgl_pt_f2d_seal = void call xgl_pt_pt_f2d

   Xgl_pt pt_f3d = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_pt_f3d
   Xgl_pt pt_f3d: proxy_null Xgl_pt_f3d* Xgl_pt_f3d_seal = void call xgl_pt_pt_f3d

   Xgl_pt pt_i2d = Xgl_pt_i2d {xgl ptI2d deadCopy} call xgl_pt_pt_i2d
   Xgl_pt pt_i2d: proxy_null Xgl_pt_i2d* Xgl_pt_i2d_seal = void call xgl_pt_pt_i2d

   Xgl_pt pt_type = any Xgl_pt_type getMember pt_type
   Xgl_pt pt_type: any Xgl_pt_type = void setMember pt_type

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt set_Pt_d2d: proxy_null Xgl_pt_d2d* Xgl_pt_d2d_seal \
	Pt_type: any Xgl_pt_type \
	 = void call xgl_pt_set

   Xgl_pt set_Pt_d3d: proxy_null Xgl_pt_d3d* Xgl_pt_d3d_seal \
	Pt_type: any Xgl_pt_type \
	 = void call xgl_pt_set

   Xgl_pt set_Pt_f2d: proxy_null Xgl_pt_f2d* Xgl_pt_f2d_seal \
	Pt_type: any Xgl_pt_type \
	 = void call xgl_pt_set

   Xgl_pt set_Pt_f3d: proxy_null Xgl_pt_f3d* Xgl_pt_f3d_seal \
	Pt_type: any Xgl_pt_type \
	 = void call xgl_pt_set

   Xgl_pt set_Pt_i2d: proxy_null Xgl_pt_i2d* Xgl_pt_i2d_seal \
	Pt_type: any Xgl_pt_type \
	 = void call xgl_pt_set


traits: traits xgl raw ptColorD2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_d2d {xgl ptColorD2d deadCopy} call xgl_pt_color_d2d_new
   Xgl_pt_color_d2d delete = void call xgl_pt_color_d2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorD2d = proxy_null Xgl_pt_color_d2d* Xgl_pt_color_d2d_seal {xgl ptColorD2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_d2d at: unsigned_int = proxy_null Xgl_pt_color_d2d* Xgl_pt_color_d2d_seal {xgl ptColorD2d deadCopy} call xgl_pt_color_d2d_at
   Xgl_pt_color_d2d at: unsigned_int Put: Xgl_pt_color_d2d = void call xgl_pt_color_d2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_d2d color_gray = float call xgl_pt_color_d2d_color_gray
   Xgl_pt_color_d2d color_gray: float = void call xgl_pt_color_d2d_color_gray

   Xgl_pt_color_d2d color_index = unsigned_long call xgl_pt_color_d2d_color_index
   Xgl_pt_color_d2d color_index: unsigned_long = void call xgl_pt_color_d2d_color_index

   Xgl_pt_color_d2d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_d2d_color_rgb
   Xgl_pt_color_d2d color_rgb: Xgl_color_rgb = void call xgl_pt_color_d2d_color_rgb

   Xgl_pt_color_d2d color_z = unsigned_long call xgl_pt_color_d2d_color_z
   Xgl_pt_color_d2d color_z: unsigned_long = void call xgl_pt_color_d2d_color_z

   Xgl_pt_color_d2d x = double getMember x
   Xgl_pt_color_d2d x: double = void setMember x

   Xgl_pt_color_d2d y = double getMember y
   Xgl_pt_color_d2d y: double = void setMember y

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_d2d set_Color_gray: float \
	X: double \
	Y: double \
	 = void call xgl_pt_color_d2d_set

   Xgl_pt_color_d2d set_Color_index: unsigned_long \
	X: double \
	Y: double \
	 = void call xgl_pt_color_d2d_set

   Xgl_pt_color_d2d set_Color_rgb: Xgl_color_rgb \
	X: double \
	Y: double \
	 = void call xgl_pt_color_d2d_set

   Xgl_pt_color_d2d set_Color_z: unsigned_long \
	X: double \
	Y: double \
	 = void call xgl_pt_color_d2d_set


traits: traits xgl raw ptColorD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_d3d {xgl ptColorD3d deadCopy} call xgl_pt_color_d3d_new
   Xgl_pt_color_d3d delete = void call xgl_pt_color_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorD3d = proxy_null Xgl_pt_color_d3d* Xgl_pt_color_d3d_seal {xgl ptColorD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_d3d at: unsigned_int = proxy_null Xgl_pt_color_d3d* Xgl_pt_color_d3d_seal {xgl ptColorD3d deadCopy} call xgl_pt_color_d3d_at
   Xgl_pt_color_d3d at: unsigned_int Put: Xgl_pt_color_d3d = void call xgl_pt_color_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_d3d color_gray = float call xgl_pt_color_d3d_color_gray
   Xgl_pt_color_d3d color_gray: float = void call xgl_pt_color_d3d_color_gray

   Xgl_pt_color_d3d color_index = unsigned_long call xgl_pt_color_d3d_color_index
   Xgl_pt_color_d3d color_index: unsigned_long = void call xgl_pt_color_d3d_color_index

   Xgl_pt_color_d3d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_d3d_color_rgb
   Xgl_pt_color_d3d color_rgb: Xgl_color_rgb = void call xgl_pt_color_d3d_color_rgb

   Xgl_pt_color_d3d color_z = unsigned_long call xgl_pt_color_d3d_color_z
   Xgl_pt_color_d3d color_z: unsigned_long = void call xgl_pt_color_d3d_color_z

   Xgl_pt_color_d3d x = double getMember x
   Xgl_pt_color_d3d x: double = void setMember x

   Xgl_pt_color_d3d y = double getMember y
   Xgl_pt_color_d3d y: double = void setMember y

   Xgl_pt_color_d3d z = double getMember z
   Xgl_pt_color_d3d z: double = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_d3d set_Color_gray: float \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_d3d_set

   Xgl_pt_color_d3d set_Color_index: unsigned_long \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_d3d_set

   Xgl_pt_color_d3d set_Color_rgb: Xgl_color_rgb \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_d3d_set

   Xgl_pt_color_d3d set_Color_z: unsigned_long \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_d3d_set


traits: traits xgl raw ptColorDataF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_data_f3d {xgl ptColorDataF3d deadCopy} call xgl_pt_color_data_f3d_new
   Xgl_pt_color_data_f3d delete = void call xgl_pt_color_data_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorDataF3d = proxy_null Xgl_pt_color_data_f3d* Xgl_pt_color_data_f3d_seal {xgl ptColorDataF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_data_f3d at: unsigned_int = proxy_null Xgl_pt_color_data_f3d* Xgl_pt_color_data_f3d_seal {xgl ptColorDataF3d deadCopy} call xgl_pt_color_data_f3d_at
   Xgl_pt_color_data_f3d at: unsigned_int Put: Xgl_pt_color_data_f3d = void call xgl_pt_color_data_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_data_f3d color_gray = float call xgl_pt_color_data_f3d_color_gray
   Xgl_pt_color_data_f3d color_gray: float = void call xgl_pt_color_data_f3d_color_gray

   Xgl_pt_color_data_f3d color_index = unsigned_long call xgl_pt_color_data_f3d_color_index
   Xgl_pt_color_data_f3d color_index: unsigned_long = void call xgl_pt_color_data_f3d_color_index

   Xgl_pt_color_data_f3d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_data_f3d_color_rgb
   Xgl_pt_color_data_f3d color_rgb: Xgl_color_rgb = void call xgl_pt_color_data_f3d_color_rgb

   Xgl_pt_color_data_f3d color_z = unsigned_long call xgl_pt_color_data_f3d_color_z
   Xgl_pt_color_data_f3d color_z: unsigned_long = void call xgl_pt_color_data_f3d_color_z

   Xgl_pt_color_data_f3d data = Float_vec_proxy {xgl floatVecProxy deadCopy} call xgl_pt_color_data_f3d_data

   Xgl_pt_color_data_f3d x = float getMember x
   Xgl_pt_color_data_f3d x: float = void setMember x

   Xgl_pt_color_data_f3d y = float getMember y
   Xgl_pt_color_data_f3d y: float = void setMember y

   Xgl_pt_color_data_f3d z = float getMember z
   Xgl_pt_color_data_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_data_f3d set_Color_gray: float \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_data_f3d_set

   Xgl_pt_color_data_f3d set_Color_index: unsigned_long \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_data_f3d_set

   Xgl_pt_color_data_f3d set_Color_rgb: Xgl_color_rgb \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_data_f3d_set

   Xgl_pt_color_data_f3d set_Color_z: unsigned_long \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_data_f3d_set


traits: traits xgl raw ptColorF2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_f2d {xgl ptColorF2d deadCopy} call xgl_pt_color_f2d_new
   Xgl_pt_color_f2d delete = void call xgl_pt_color_f2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorF2d = proxy_null Xgl_pt_color_f2d* Xgl_pt_color_f2d_seal {xgl ptColorF2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_f2d at: unsigned_int = proxy_null Xgl_pt_color_f2d* Xgl_pt_color_f2d_seal {xgl ptColorF2d deadCopy} call xgl_pt_color_f2d_at
   Xgl_pt_color_f2d at: unsigned_int Put: Xgl_pt_color_f2d = void call xgl_pt_color_f2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_f2d color_gray = float call xgl_pt_color_f2d_color_gray
   Xgl_pt_color_f2d color_gray: float = void call xgl_pt_color_f2d_color_gray

   Xgl_pt_color_f2d color_index = unsigned_long call xgl_pt_color_f2d_color_index
   Xgl_pt_color_f2d color_index: unsigned_long = void call xgl_pt_color_f2d_color_index

   Xgl_pt_color_f2d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_f2d_color_rgb
   Xgl_pt_color_f2d color_rgb: Xgl_color_rgb = void call xgl_pt_color_f2d_color_rgb

   Xgl_pt_color_f2d color_z = unsigned_long call xgl_pt_color_f2d_color_z
   Xgl_pt_color_f2d color_z: unsigned_long = void call xgl_pt_color_f2d_color_z

   Xgl_pt_color_f2d x = float getMember x
   Xgl_pt_color_f2d x: float = void setMember x

   Xgl_pt_color_f2d y = float getMember y
   Xgl_pt_color_f2d y: float = void setMember y

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_f2d set_Color_gray: float \
	X: float \
	Y: float \
	 = void call xgl_pt_color_f2d_set

   Xgl_pt_color_f2d set_Color_index: unsigned_long \
	X: float \
	Y: float \
	 = void call xgl_pt_color_f2d_set

   Xgl_pt_color_f2d set_Color_rgb: Xgl_color_rgb \
	X: float \
	Y: float \
	 = void call xgl_pt_color_f2d_set

   Xgl_pt_color_f2d set_Color_z: unsigned_long \
	X: float \
	Y: float \
	 = void call xgl_pt_color_f2d_set


traits: traits xgl raw ptColorF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_f3d {xgl ptColorF3d deadCopy} call xgl_pt_color_f3d_new
   Xgl_pt_color_f3d delete = void call xgl_pt_color_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorF3d = proxy_null Xgl_pt_color_f3d* Xgl_pt_color_f3d_seal {xgl ptColorF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_f3d at: unsigned_int = proxy_null Xgl_pt_color_f3d* Xgl_pt_color_f3d_seal {xgl ptColorF3d deadCopy} call xgl_pt_color_f3d_at
   Xgl_pt_color_f3d at: unsigned_int Put: Xgl_pt_color_f3d = void call xgl_pt_color_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_f3d color_gray = float call xgl_pt_color_f3d_color_gray
   Xgl_pt_color_f3d color_gray: float = void call xgl_pt_color_f3d_color_gray

   Xgl_pt_color_f3d color_index = unsigned_long call xgl_pt_color_f3d_color_index
   Xgl_pt_color_f3d color_index: unsigned_long = void call xgl_pt_color_f3d_color_index

   Xgl_pt_color_f3d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_f3d_color_rgb
   Xgl_pt_color_f3d color_rgb: Xgl_color_rgb = void call xgl_pt_color_f3d_color_rgb

   Xgl_pt_color_f3d color_z = unsigned_long call xgl_pt_color_f3d_color_z
   Xgl_pt_color_f3d color_z: unsigned_long = void call xgl_pt_color_f3d_color_z

   Xgl_pt_color_f3d x = float getMember x
   Xgl_pt_color_f3d x: float = void setMember x

   Xgl_pt_color_f3d y = float getMember y
   Xgl_pt_color_f3d y: float = void setMember y

   Xgl_pt_color_f3d z = float getMember z
   Xgl_pt_color_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_f3d set_Color_gray: float \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_f3d_set

   Xgl_pt_color_f3d set_Color_index: unsigned_long \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_f3d_set

   Xgl_pt_color_f3d set_Color_rgb: Xgl_color_rgb \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_f3d_set

   Xgl_pt_color_f3d set_Color_z: unsigned_long \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_f3d_set


traits: traits xgl raw ptColorFlagD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_flag_d3d {xgl ptColorFlagD3d deadCopy} call xgl_pt_color_flag_d3d_new
   Xgl_pt_color_flag_d3d delete = void call xgl_pt_color_flag_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorFlagD3d = proxy_null Xgl_pt_color_flag_d3d* Xgl_pt_color_flag_d3d_seal {xgl ptColorFlagD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_flag_d3d at: unsigned_int = proxy_null Xgl_pt_color_flag_d3d* Xgl_pt_color_flag_d3d_seal {xgl ptColorFlagD3d deadCopy} call xgl_pt_color_flag_d3d_at
   Xgl_pt_color_flag_d3d at: unsigned_int Put: Xgl_pt_color_flag_d3d = void call xgl_pt_color_flag_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_flag_d3d color_gray = float call xgl_pt_color_flag_d3d_color_gray
   Xgl_pt_color_flag_d3d color_gray: float = void call xgl_pt_color_flag_d3d_color_gray

   Xgl_pt_color_flag_d3d color_index = unsigned_long call xgl_pt_color_flag_d3d_color_index
   Xgl_pt_color_flag_d3d color_index: unsigned_long = void call xgl_pt_color_flag_d3d_color_index

   Xgl_pt_color_flag_d3d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_flag_d3d_color_rgb
   Xgl_pt_color_flag_d3d color_rgb: Xgl_color_rgb = void call xgl_pt_color_flag_d3d_color_rgb

   Xgl_pt_color_flag_d3d color_z = unsigned_long call xgl_pt_color_flag_d3d_color_z
   Xgl_pt_color_flag_d3d color_z: unsigned_long = void call xgl_pt_color_flag_d3d_color_z

   Xgl_pt_color_flag_d3d flag = unsigned_long getMember flag
   Xgl_pt_color_flag_d3d flag: unsigned_long = void setMember flag

   Xgl_pt_color_flag_d3d x = double getMember x
   Xgl_pt_color_flag_d3d x: double = void setMember x

   Xgl_pt_color_flag_d3d y = double getMember y
   Xgl_pt_color_flag_d3d y: double = void setMember y

   Xgl_pt_color_flag_d3d z = double getMember z
   Xgl_pt_color_flag_d3d z: double = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_flag_d3d set_Color_gray: float \
	Flag: unsigned_long \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_flag_d3d_set

   Xgl_pt_color_flag_d3d set_Color_index: unsigned_long \
	Flag: unsigned_long \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_flag_d3d_set

   Xgl_pt_color_flag_d3d set_Color_rgb: Xgl_color_rgb \
	Flag: unsigned_long \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_flag_d3d_set

   Xgl_pt_color_flag_d3d set_Color_z: unsigned_long \
	Flag: unsigned_long \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_flag_d3d_set


traits: traits xgl raw ptColorFlagDataF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_flag_data_f3d {xgl ptColorFlagDataF3d deadCopy} call xgl_pt_color_flag_data_f3d_new
   Xgl_pt_color_flag_data_f3d delete = void call xgl_pt_color_flag_data_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorFlagDataF3d = proxy_null Xgl_pt_color_flag_data_f3d* Xgl_pt_color_flag_data_f3d_seal {xgl ptColorFlagDataF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_flag_data_f3d at: unsigned_int = proxy_null Xgl_pt_color_flag_data_f3d* Xgl_pt_color_flag_data_f3d_seal {xgl ptColorFlagDataF3d deadCopy} call xgl_pt_color_flag_data_f3d_at
   Xgl_pt_color_flag_data_f3d at: unsigned_int Put: Xgl_pt_color_flag_data_f3d = void call xgl_pt_color_flag_data_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_flag_data_f3d color_gray = float call xgl_pt_color_flag_data_f3d_color_gray
   Xgl_pt_color_flag_data_f3d color_gray: float = void call xgl_pt_color_flag_data_f3d_color_gray

   Xgl_pt_color_flag_data_f3d color_index = unsigned_long call xgl_pt_color_flag_data_f3d_color_index
   Xgl_pt_color_flag_data_f3d color_index: unsigned_long = void call xgl_pt_color_flag_data_f3d_color_index

   Xgl_pt_color_flag_data_f3d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_flag_data_f3d_color_rgb
   Xgl_pt_color_flag_data_f3d color_rgb: Xgl_color_rgb = void call xgl_pt_color_flag_data_f3d_color_rgb

   Xgl_pt_color_flag_data_f3d color_z = unsigned_long call xgl_pt_color_flag_data_f3d_color_z
   Xgl_pt_color_flag_data_f3d color_z: unsigned_long = void call xgl_pt_color_flag_data_f3d_color_z

   Xgl_pt_color_flag_data_f3d data = Float_vec_proxy {xgl floatVecProxy deadCopy} call xgl_pt_color_flag_data_f3d_data

   Xgl_pt_color_flag_data_f3d flag = unsigned_long getMember flag
   Xgl_pt_color_flag_data_f3d flag: unsigned_long = void setMember flag

   Xgl_pt_color_flag_data_f3d x = float getMember x
   Xgl_pt_color_flag_data_f3d x: float = void setMember x

   Xgl_pt_color_flag_data_f3d y = float getMember y
   Xgl_pt_color_flag_data_f3d y: float = void setMember y

   Xgl_pt_color_flag_data_f3d z = float getMember z
   Xgl_pt_color_flag_data_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_flag_data_f3d set_Color_gray: float \
	Flag: unsigned_long \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_flag_data_f3d_set

   Xgl_pt_color_flag_data_f3d set_Color_index: unsigned_long \
	Flag: unsigned_long \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_flag_data_f3d_set

   Xgl_pt_color_flag_data_f3d set_Color_rgb: Xgl_color_rgb \
	Flag: unsigned_long \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_flag_data_f3d_set

   Xgl_pt_color_flag_data_f3d set_Color_z: unsigned_long \
	Flag: unsigned_long \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_flag_data_f3d_set


traits: traits xgl raw ptColorFlagF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_flag_f3d {xgl ptColorFlagF3d deadCopy} call xgl_pt_color_flag_f3d_new
   Xgl_pt_color_flag_f3d delete = void call xgl_pt_color_flag_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorFlagF3d = proxy_null Xgl_pt_color_flag_f3d* Xgl_pt_color_flag_f3d_seal {xgl ptColorFlagF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_flag_f3d at: unsigned_int = proxy_null Xgl_pt_color_flag_f3d* Xgl_pt_color_flag_f3d_seal {xgl ptColorFlagF3d deadCopy} call xgl_pt_color_flag_f3d_at
   Xgl_pt_color_flag_f3d at: unsigned_int Put: Xgl_pt_color_flag_f3d = void call xgl_pt_color_flag_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_flag_f3d color_gray = float call xgl_pt_color_flag_f3d_color_gray
   Xgl_pt_color_flag_f3d color_gray: float = void call xgl_pt_color_flag_f3d_color_gray

   Xgl_pt_color_flag_f3d color_index = unsigned_long call xgl_pt_color_flag_f3d_color_index
   Xgl_pt_color_flag_f3d color_index: unsigned_long = void call xgl_pt_color_flag_f3d_color_index

   Xgl_pt_color_flag_f3d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_flag_f3d_color_rgb
   Xgl_pt_color_flag_f3d color_rgb: Xgl_color_rgb = void call xgl_pt_color_flag_f3d_color_rgb

   Xgl_pt_color_flag_f3d color_z = unsigned_long call xgl_pt_color_flag_f3d_color_z
   Xgl_pt_color_flag_f3d color_z: unsigned_long = void call xgl_pt_color_flag_f3d_color_z

   Xgl_pt_color_flag_f3d flag = unsigned_long getMember flag
   Xgl_pt_color_flag_f3d flag: unsigned_long = void setMember flag

   Xgl_pt_color_flag_f3d x = float getMember x
   Xgl_pt_color_flag_f3d x: float = void setMember x

   Xgl_pt_color_flag_f3d y = float getMember y
   Xgl_pt_color_flag_f3d y: float = void setMember y

   Xgl_pt_color_flag_f3d z = float getMember z
   Xgl_pt_color_flag_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_flag_f3d set_Color_gray: float \
	Flag: unsigned_long \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_flag_f3d_set

   Xgl_pt_color_flag_f3d set_Color_index: unsigned_long \
	Flag: unsigned_long \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_flag_f3d_set

   Xgl_pt_color_flag_f3d set_Color_rgb: Xgl_color_rgb \
	Flag: unsigned_long \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_flag_f3d_set

   Xgl_pt_color_flag_f3d set_Color_z: unsigned_long \
	Flag: unsigned_long \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_flag_f3d_set


traits: traits xgl raw ptColorI2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_i2d {xgl ptColorI2d deadCopy} call xgl_pt_color_i2d_new
   Xgl_pt_color_i2d delete = void call xgl_pt_color_i2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorI2d = proxy_null Xgl_pt_color_i2d* Xgl_pt_color_i2d_seal {xgl ptColorI2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_i2d at: unsigned_int = proxy_null Xgl_pt_color_i2d* Xgl_pt_color_i2d_seal {xgl ptColorI2d deadCopy} call xgl_pt_color_i2d_at
   Xgl_pt_color_i2d at: unsigned_int Put: Xgl_pt_color_i2d = void call xgl_pt_color_i2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_i2d color_gray = float call xgl_pt_color_i2d_color_gray
   Xgl_pt_color_i2d color_gray: float = void call xgl_pt_color_i2d_color_gray

   Xgl_pt_color_i2d color_index = unsigned_long call xgl_pt_color_i2d_color_index
   Xgl_pt_color_i2d color_index: unsigned_long = void call xgl_pt_color_i2d_color_index

   Xgl_pt_color_i2d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_i2d_color_rgb
   Xgl_pt_color_i2d color_rgb: Xgl_color_rgb = void call xgl_pt_color_i2d_color_rgb

   Xgl_pt_color_i2d color_z = unsigned_long call xgl_pt_color_i2d_color_z
   Xgl_pt_color_i2d color_z: unsigned_long = void call xgl_pt_color_i2d_color_z

   Xgl_pt_color_i2d x = long getMember x
   Xgl_pt_color_i2d x: long = void setMember x

   Xgl_pt_color_i2d y = long getMember y
   Xgl_pt_color_i2d y: long = void setMember y

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_i2d set_Color_gray: float \
	X: long \
	Y: long \
	 = void call xgl_pt_color_i2d_set

   Xgl_pt_color_i2d set_Color_index: unsigned_long \
	X: long \
	Y: long \
	 = void call xgl_pt_color_i2d_set

   Xgl_pt_color_i2d set_Color_rgb: Xgl_color_rgb \
	X: long \
	Y: long \
	 = void call xgl_pt_color_i2d_set

   Xgl_pt_color_i2d set_Color_z: unsigned_long \
	X: long \
	Y: long \
	 = void call xgl_pt_color_i2d_set

','

traits: traits xgl raw ptColorNormalD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_normal_d3d {xgl ptColorNormalD3d deadCopy} call xgl_pt_color_normal_d3d_new
   Xgl_pt_color_normal_d3d delete = void call xgl_pt_color_normal_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorNormalD3d = proxy_null Xgl_pt_color_normal_d3d* Xgl_pt_color_normal_d3d_seal {xgl ptColorNormalD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_normal_d3d at: unsigned_int = proxy_null Xgl_pt_color_normal_d3d* Xgl_pt_color_normal_d3d_seal {xgl ptColorNormalD3d deadCopy} call xgl_pt_color_normal_d3d_at
   Xgl_pt_color_normal_d3d at: unsigned_int Put: Xgl_pt_color_normal_d3d = void call xgl_pt_color_normal_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_normal_d3d color_gray = float call xgl_pt_color_normal_d3d_color_gray
   Xgl_pt_color_normal_d3d color_gray: float = void call xgl_pt_color_normal_d3d_color_gray

   Xgl_pt_color_normal_d3d color_index = unsigned_long call xgl_pt_color_normal_d3d_color_index
   Xgl_pt_color_normal_d3d color_index: unsigned_long = void call xgl_pt_color_normal_d3d_color_index

   Xgl_pt_color_normal_d3d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_normal_d3d_color_rgb
   Xgl_pt_color_normal_d3d color_rgb: Xgl_color_rgb = void call xgl_pt_color_normal_d3d_color_rgb

   Xgl_pt_color_normal_d3d color_z = unsigned_long call xgl_pt_color_normal_d3d_color_z
   Xgl_pt_color_normal_d3d color_z: unsigned_long = void call xgl_pt_color_normal_d3d_color_z

   Xgl_pt_color_normal_d3d normal = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_color_normal_d3d_normal
   Xgl_pt_color_normal_d3d normal: Xgl_pt_f3d = void call xgl_pt_color_normal_d3d_normal

   Xgl_pt_color_normal_d3d x = double getMember x
   Xgl_pt_color_normal_d3d x: double = void setMember x

   Xgl_pt_color_normal_d3d y = double getMember y
   Xgl_pt_color_normal_d3d y: double = void setMember y

   Xgl_pt_color_normal_d3d z = double getMember z
   Xgl_pt_color_normal_d3d z: double = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_normal_d3d set_Color_gray: float \
	Normal: Xgl_pt_f3d \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_normal_d3d_set

   Xgl_pt_color_normal_d3d set_Color_index: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_normal_d3d_set

   Xgl_pt_color_normal_d3d set_Color_rgb: Xgl_color_rgb \
	Normal: Xgl_pt_f3d \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_normal_d3d_set

   Xgl_pt_color_normal_d3d set_Color_z: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_normal_d3d_set


traits: traits xgl raw ptColorNormalDataF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_normal_data_f3d {xgl ptColorNormalDataF3d deadCopy} call xgl_pt_color_normal_data_f3d_new
   Xgl_pt_color_normal_data_f3d delete = void call xgl_pt_color_normal_data_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorNormalDataF3d = proxy_null Xgl_pt_color_normal_data_f3d* Xgl_pt_color_normal_data_f3d_seal {xgl ptColorNormalDataF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_normal_data_f3d at: unsigned_int = proxy_null Xgl_pt_color_normal_data_f3d* Xgl_pt_color_normal_data_f3d_seal {xgl ptColorNormalDataF3d deadCopy} call xgl_pt_color_normal_data_f3d_at
   Xgl_pt_color_normal_data_f3d at: unsigned_int Put: Xgl_pt_color_normal_data_f3d = void call xgl_pt_color_normal_data_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_normal_data_f3d color_gray = float call xgl_pt_color_normal_data_f3d_color_gray
   Xgl_pt_color_normal_data_f3d color_gray: float = void call xgl_pt_color_normal_data_f3d_color_gray

   Xgl_pt_color_normal_data_f3d color_index = unsigned_long call xgl_pt_color_normal_data_f3d_color_index
   Xgl_pt_color_normal_data_f3d color_index: unsigned_long = void call xgl_pt_color_normal_data_f3d_color_index

   Xgl_pt_color_normal_data_f3d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_normal_data_f3d_color_rgb
   Xgl_pt_color_normal_data_f3d color_rgb: Xgl_color_rgb = void call xgl_pt_color_normal_data_f3d_color_rgb

   Xgl_pt_color_normal_data_f3d color_z = unsigned_long call xgl_pt_color_normal_data_f3d_color_z
   Xgl_pt_color_normal_data_f3d color_z: unsigned_long = void call xgl_pt_color_normal_data_f3d_color_z

   Xgl_pt_color_normal_data_f3d data = Float_vec_proxy {xgl floatVecProxy deadCopy} call xgl_pt_color_normal_data_f3d_data

   Xgl_pt_color_normal_data_f3d normal = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_color_normal_data_f3d_normal
   Xgl_pt_color_normal_data_f3d normal: Xgl_pt_f3d = void call xgl_pt_color_normal_data_f3d_normal

   Xgl_pt_color_normal_data_f3d x = float getMember x
   Xgl_pt_color_normal_data_f3d x: float = void setMember x

   Xgl_pt_color_normal_data_f3d y = float getMember y
   Xgl_pt_color_normal_data_f3d y: float = void setMember y

   Xgl_pt_color_normal_data_f3d z = float getMember z
   Xgl_pt_color_normal_data_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_normal_data_f3d set_Color_gray: float \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_data_f3d_set

   Xgl_pt_color_normal_data_f3d set_Color_index: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_data_f3d_set

   Xgl_pt_color_normal_data_f3d set_Color_rgb: Xgl_color_rgb \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_data_f3d_set

   Xgl_pt_color_normal_data_f3d set_Color_z: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_data_f3d_set


traits: traits xgl raw ptColorNormalF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_normal_f3d {xgl ptColorNormalF3d deadCopy} call xgl_pt_color_normal_f3d_new
   Xgl_pt_color_normal_f3d delete = void call xgl_pt_color_normal_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorNormalF3d = proxy_null Xgl_pt_color_normal_f3d* Xgl_pt_color_normal_f3d_seal {xgl ptColorNormalF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_normal_f3d at: unsigned_int = proxy_null Xgl_pt_color_normal_f3d* Xgl_pt_color_normal_f3d_seal {xgl ptColorNormalF3d deadCopy} call xgl_pt_color_normal_f3d_at
   Xgl_pt_color_normal_f3d at: unsigned_int Put: Xgl_pt_color_normal_f3d = void call xgl_pt_color_normal_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_normal_f3d color_gray = float call xgl_pt_color_normal_f3d_color_gray
   Xgl_pt_color_normal_f3d color_gray: float = void call xgl_pt_color_normal_f3d_color_gray

   Xgl_pt_color_normal_f3d color_index = unsigned_long call xgl_pt_color_normal_f3d_color_index
   Xgl_pt_color_normal_f3d color_index: unsigned_long = void call xgl_pt_color_normal_f3d_color_index

   Xgl_pt_color_normal_f3d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_normal_f3d_color_rgb
   Xgl_pt_color_normal_f3d color_rgb: Xgl_color_rgb = void call xgl_pt_color_normal_f3d_color_rgb

   Xgl_pt_color_normal_f3d color_z = unsigned_long call xgl_pt_color_normal_f3d_color_z
   Xgl_pt_color_normal_f3d color_z: unsigned_long = void call xgl_pt_color_normal_f3d_color_z

   Xgl_pt_color_normal_f3d normal = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_color_normal_f3d_normal
   Xgl_pt_color_normal_f3d normal: Xgl_pt_f3d = void call xgl_pt_color_normal_f3d_normal

   Xgl_pt_color_normal_f3d x = float getMember x
   Xgl_pt_color_normal_f3d x: float = void setMember x

   Xgl_pt_color_normal_f3d y = float getMember y
   Xgl_pt_color_normal_f3d y: float = void setMember y

   Xgl_pt_color_normal_f3d z = float getMember z
   Xgl_pt_color_normal_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_normal_f3d set_Color_gray: float \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_f3d_set

   Xgl_pt_color_normal_f3d set_Color_index: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_f3d_set

   Xgl_pt_color_normal_f3d set_Color_rgb: Xgl_color_rgb \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_f3d_set

   Xgl_pt_color_normal_f3d set_Color_z: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_f3d_set


traits: traits xgl raw ptColorNormalFlagD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_normal_flag_d3d {xgl ptColorNormalFlagD3d deadCopy} call xgl_pt_color_normal_flag_d3d_new
   Xgl_pt_color_normal_flag_d3d delete = void call xgl_pt_color_normal_flag_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorNormalFlagD3d = proxy_null Xgl_pt_color_normal_flag_d3d* Xgl_pt_color_normal_flag_d3d_seal {xgl ptColorNormalFlagD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_normal_flag_d3d at: unsigned_int = proxy_null Xgl_pt_color_normal_flag_d3d* Xgl_pt_color_normal_flag_d3d_seal {xgl ptColorNormalFlagD3d deadCopy} call xgl_pt_color_normal_flag_d3d_at
   Xgl_pt_color_normal_flag_d3d at: unsigned_int Put: Xgl_pt_color_normal_flag_d3d = void call xgl_pt_color_normal_flag_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_normal_flag_d3d color_gray = float call xgl_pt_color_normal_flag_d3d_color_gray
   Xgl_pt_color_normal_flag_d3d color_gray: float = void call xgl_pt_color_normal_flag_d3d_color_gray

   Xgl_pt_color_normal_flag_d3d color_index = unsigned_long call xgl_pt_color_normal_flag_d3d_color_index
   Xgl_pt_color_normal_flag_d3d color_index: unsigned_long = void call xgl_pt_color_normal_flag_d3d_color_index

   Xgl_pt_color_normal_flag_d3d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_normal_flag_d3d_color_rgb
   Xgl_pt_color_normal_flag_d3d color_rgb: Xgl_color_rgb = void call xgl_pt_color_normal_flag_d3d_color_rgb

   Xgl_pt_color_normal_flag_d3d color_z = unsigned_long call xgl_pt_color_normal_flag_d3d_color_z
   Xgl_pt_color_normal_flag_d3d color_z: unsigned_long = void call xgl_pt_color_normal_flag_d3d_color_z

   Xgl_pt_color_normal_flag_d3d flag = unsigned_long getMember flag
   Xgl_pt_color_normal_flag_d3d flag: unsigned_long = void setMember flag

   Xgl_pt_color_normal_flag_d3d normal = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_color_normal_flag_d3d_normal
   Xgl_pt_color_normal_flag_d3d normal: Xgl_pt_f3d = void call xgl_pt_color_normal_flag_d3d_normal

   Xgl_pt_color_normal_flag_d3d x = double getMember x
   Xgl_pt_color_normal_flag_d3d x: double = void setMember x

   Xgl_pt_color_normal_flag_d3d y = double getMember y
   Xgl_pt_color_normal_flag_d3d y: double = void setMember y

   Xgl_pt_color_normal_flag_d3d z = double getMember z
   Xgl_pt_color_normal_flag_d3d z: double = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_normal_flag_d3d set_Color_gray: float \
	Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_normal_flag_d3d_set

   Xgl_pt_color_normal_flag_d3d set_Color_index: unsigned_long \
	Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_normal_flag_d3d_set

   Xgl_pt_color_normal_flag_d3d set_Color_rgb: Xgl_color_rgb \
	Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_normal_flag_d3d_set

   Xgl_pt_color_normal_flag_d3d set_Color_z: unsigned_long \
	Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_color_normal_flag_d3d_set


traits: traits xgl raw ptColorNormalFlagDataF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_normal_flag_data_f3d {xgl ptColorNormalFlagDataF3d deadCopy} call xgl_pt_color_normal_flag_data_f3d_new
   Xgl_pt_color_normal_flag_data_f3d delete = void call xgl_pt_color_normal_flag_data_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorNormalFlagDataF3d = proxy_null Xgl_pt_color_normal_flag_data_f3d* Xgl_pt_color_normal_flag_data_f3d_seal {xgl ptColorNormalFlagDataF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_normal_flag_data_f3d at: unsigned_int = proxy_null Xgl_pt_color_normal_flag_data_f3d* Xgl_pt_color_normal_flag_data_f3d_seal {xgl ptColorNormalFlagDataF3d deadCopy} call xgl_pt_color_normal_flag_data_f3d_at
   Xgl_pt_color_normal_flag_data_f3d at: unsigned_int Put: Xgl_pt_color_normal_flag_data_f3d = void call xgl_pt_color_normal_flag_data_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_normal_flag_data_f3d color_gray = float call xgl_pt_color_normal_flag_data_f3d_color_gray
   Xgl_pt_color_normal_flag_data_f3d color_gray: float = void call xgl_pt_color_normal_flag_data_f3d_color_gray

   Xgl_pt_color_normal_flag_data_f3d color_index = unsigned_long call xgl_pt_color_normal_flag_data_f3d_color_index
   Xgl_pt_color_normal_flag_data_f3d color_index: unsigned_long = void call xgl_pt_color_normal_flag_data_f3d_color_index

   Xgl_pt_color_normal_flag_data_f3d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_normal_flag_data_f3d_color_rgb
   Xgl_pt_color_normal_flag_data_f3d color_rgb: Xgl_color_rgb = void call xgl_pt_color_normal_flag_data_f3d_color_rgb

   Xgl_pt_color_normal_flag_data_f3d color_z = unsigned_long call xgl_pt_color_normal_flag_data_f3d_color_z
   Xgl_pt_color_normal_flag_data_f3d color_z: unsigned_long = void call xgl_pt_color_normal_flag_data_f3d_color_z

   Xgl_pt_color_normal_flag_data_f3d data = Float_vec_proxy {xgl floatVecProxy deadCopy} call xgl_pt_color_normal_flag_data_f3d_data

   Xgl_pt_color_normal_flag_data_f3d flag = unsigned_long getMember flag
   Xgl_pt_color_normal_flag_data_f3d flag: unsigned_long = void setMember flag

   Xgl_pt_color_normal_flag_data_f3d normal = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_color_normal_flag_data_f3d_normal
   Xgl_pt_color_normal_flag_data_f3d normal: Xgl_pt_f3d = void call xgl_pt_color_normal_flag_data_f3d_normal

   Xgl_pt_color_normal_flag_data_f3d x = float getMember x
   Xgl_pt_color_normal_flag_data_f3d x: float = void setMember x

   Xgl_pt_color_normal_flag_data_f3d y = float getMember y
   Xgl_pt_color_normal_flag_data_f3d y: float = void setMember y

   Xgl_pt_color_normal_flag_data_f3d z = float getMember z
   Xgl_pt_color_normal_flag_data_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_normal_flag_data_f3d set_Color_gray: float \
	Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_flag_data_f3d_set

   Xgl_pt_color_normal_flag_data_f3d set_Color_index: unsigned_long \
	Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_flag_data_f3d_set

   Xgl_pt_color_normal_flag_data_f3d set_Color_rgb: Xgl_color_rgb \
	Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_flag_data_f3d_set

   Xgl_pt_color_normal_flag_data_f3d set_Color_z: unsigned_long \
	Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_flag_data_f3d_set


traits: traits xgl raw ptColorNormalFlagF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_color_normal_flag_f3d {xgl ptColorNormalFlagF3d deadCopy} call xgl_pt_color_normal_flag_f3d_new
   Xgl_pt_color_normal_flag_f3d delete = void call xgl_pt_color_normal_flag_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtColorNormalFlagF3d = proxy_null Xgl_pt_color_normal_flag_f3d* Xgl_pt_color_normal_flag_f3d_seal {xgl ptColorNormalFlagF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_color_normal_flag_f3d at: unsigned_int = proxy_null Xgl_pt_color_normal_flag_f3d* Xgl_pt_color_normal_flag_f3d_seal {xgl ptColorNormalFlagF3d deadCopy} call xgl_pt_color_normal_flag_f3d_at
   Xgl_pt_color_normal_flag_f3d at: unsigned_int Put: Xgl_pt_color_normal_flag_f3d = void call xgl_pt_color_normal_flag_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_color_normal_flag_f3d color_gray = float call xgl_pt_color_normal_flag_f3d_color_gray
   Xgl_pt_color_normal_flag_f3d color_gray: float = void call xgl_pt_color_normal_flag_f3d_color_gray

   Xgl_pt_color_normal_flag_f3d color_index = unsigned_long call xgl_pt_color_normal_flag_f3d_color_index
   Xgl_pt_color_normal_flag_f3d color_index: unsigned_long = void call xgl_pt_color_normal_flag_f3d_color_index

   Xgl_pt_color_normal_flag_f3d color_rgb = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_pt_color_normal_flag_f3d_color_rgb
   Xgl_pt_color_normal_flag_f3d color_rgb: Xgl_color_rgb = void call xgl_pt_color_normal_flag_f3d_color_rgb

   Xgl_pt_color_normal_flag_f3d color_z = unsigned_long call xgl_pt_color_normal_flag_f3d_color_z
   Xgl_pt_color_normal_flag_f3d color_z: unsigned_long = void call xgl_pt_color_normal_flag_f3d_color_z

   Xgl_pt_color_normal_flag_f3d flag = unsigned_long getMember flag
   Xgl_pt_color_normal_flag_f3d flag: unsigned_long = void setMember flag

   Xgl_pt_color_normal_flag_f3d normal = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_color_normal_flag_f3d_normal
   Xgl_pt_color_normal_flag_f3d normal: Xgl_pt_f3d = void call xgl_pt_color_normal_flag_f3d_normal

   Xgl_pt_color_normal_flag_f3d x = float getMember x
   Xgl_pt_color_normal_flag_f3d x: float = void setMember x

   Xgl_pt_color_normal_flag_f3d y = float getMember y
   Xgl_pt_color_normal_flag_f3d y: float = void setMember y

   Xgl_pt_color_normal_flag_f3d z = float getMember z
   Xgl_pt_color_normal_flag_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_color_normal_flag_f3d set_Color_gray: float \
	Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_flag_f3d_set

   Xgl_pt_color_normal_flag_f3d set_Color_index: unsigned_long \
	Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_flag_f3d_set

   Xgl_pt_color_normal_flag_f3d set_Color_rgb: Xgl_color_rgb \
	Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_flag_f3d_set

   Xgl_pt_color_normal_flag_f3d set_Color_z: unsigned_long \
	Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_color_normal_flag_f3d_set


traits: traits xgl raw ptD2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_d2d {xgl ptD2d deadCopy} call xgl_pt_d2d_new
   Xgl_pt_d2d delete = void call xgl_pt_d2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtD2d = proxy_null Xgl_pt_d2d* Xgl_pt_d2d_seal {xgl ptD2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_d2d at: unsigned_int = proxy_null Xgl_pt_d2d* Xgl_pt_d2d_seal {xgl ptD2d deadCopy} call xgl_pt_d2d_at
   Xgl_pt_d2d at: unsigned_int Put: Xgl_pt_d2d = void call xgl_pt_d2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_d2d x = double getMember x
   Xgl_pt_d2d x: double = void setMember x

   Xgl_pt_d2d y = double getMember y
   Xgl_pt_d2d y: double = void setMember y


traits: traits xgl raw ptD2h
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_d2h {xgl ptD2h deadCopy} call xgl_pt_d2h_new
   Xgl_pt_d2h delete = void call xgl_pt_d2h_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtD2h = proxy_null Xgl_pt_d2h* Xgl_pt_d2h_seal {xgl ptD2h deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_d2h at: unsigned_int = proxy_null Xgl_pt_d2h* Xgl_pt_d2h_seal {xgl ptD2h deadCopy} call xgl_pt_d2h_at
   Xgl_pt_d2h at: unsigned_int Put: Xgl_pt_d2h = void call xgl_pt_d2h_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_d2h w = double getMember w
   Xgl_pt_d2h w: double = void setMember w

   Xgl_pt_d2h x = double getMember x
   Xgl_pt_d2h x: double = void setMember x

   Xgl_pt_d2h y = double getMember y
   Xgl_pt_d2h y: double = void setMember y

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_d2h set_W: double \
	X: double \
	Y: double \
	 = void call xgl_pt_d2h_set


traits: traits xgl raw ptD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_d3d {xgl ptD3d deadCopy} call xgl_pt_d3d_new
   Xgl_pt_d3d delete = void call xgl_pt_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtD3d = proxy_null Xgl_pt_d3d* Xgl_pt_d3d_seal {xgl ptD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_d3d at: unsigned_int = proxy_null Xgl_pt_d3d* Xgl_pt_d3d_seal {xgl ptD3d deadCopy} call xgl_pt_d3d_at
   Xgl_pt_d3d at: unsigned_int Put: Xgl_pt_d3d = void call xgl_pt_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_d3d x = double getMember x
   Xgl_pt_d3d x: double = void setMember x

   Xgl_pt_d3d y = double getMember y
   Xgl_pt_d3d y: double = void setMember y

   Xgl_pt_d3d z = double getMember z
   Xgl_pt_d3d z: double = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_d3d set_X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_d3d_set


traits: traits xgl raw ptD3h
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_d3h {xgl ptD3h deadCopy} call xgl_pt_d3h_new
   Xgl_pt_d3h delete = void call xgl_pt_d3h_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtD3h = proxy_null Xgl_pt_d3h* Xgl_pt_d3h_seal {xgl ptD3h deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_d3h at: unsigned_int = proxy_null Xgl_pt_d3h* Xgl_pt_d3h_seal {xgl ptD3h deadCopy} call xgl_pt_d3h_at
   Xgl_pt_d3h at: unsigned_int Put: Xgl_pt_d3h = void call xgl_pt_d3h_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_d3h w = double getMember w
   Xgl_pt_d3h w: double = void setMember w

   Xgl_pt_d3h x = double getMember x
   Xgl_pt_d3h x: double = void setMember x

   Xgl_pt_d3h y = double getMember y
   Xgl_pt_d3h y: double = void setMember y

   Xgl_pt_d3h z = double getMember z
   Xgl_pt_d3h z: double = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_d3h set_W: double \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_d3h_set


traits: traits xgl raw ptDataF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_data_f3d {xgl ptDataF3d deadCopy} call xgl_pt_data_f3d_new
   Xgl_pt_data_f3d delete = void call xgl_pt_data_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtDataF3d = proxy_null Xgl_pt_data_f3d* Xgl_pt_data_f3d_seal {xgl ptDataF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_data_f3d at: unsigned_int = proxy_null Xgl_pt_data_f3d* Xgl_pt_data_f3d_seal {xgl ptDataF3d deadCopy} call xgl_pt_data_f3d_at
   Xgl_pt_data_f3d at: unsigned_int Put: Xgl_pt_data_f3d = void call xgl_pt_data_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_data_f3d data = Float_vec_proxy {xgl floatVecProxy deadCopy} call xgl_pt_data_f3d_data

   Xgl_pt_data_f3d x = float getMember x
   Xgl_pt_data_f3d x: float = void setMember x

   Xgl_pt_data_f3d y = float getMember y
   Xgl_pt_data_f3d y: float = void setMember y

   Xgl_pt_data_f3d z = float getMember z
   Xgl_pt_data_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_data_f3d set_X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_data_f3d_set


traits: traits xgl raw ptF2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_f2d {xgl ptF2d deadCopy} call xgl_pt_f2d_new
   Xgl_pt_f2d delete = void call xgl_pt_f2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtF2d = proxy_null Xgl_pt_f2d* Xgl_pt_f2d_seal {xgl ptF2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_f2d at: unsigned_int = proxy_null Xgl_pt_f2d* Xgl_pt_f2d_seal {xgl ptF2d deadCopy} call xgl_pt_f2d_at
   Xgl_pt_f2d at: unsigned_int Put: Xgl_pt_f2d = void call xgl_pt_f2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_f2d x = float getMember x
   Xgl_pt_f2d x: float = void setMember x

   Xgl_pt_f2d y = float getMember y
   Xgl_pt_f2d y: float = void setMember y


traits: traits xgl raw ptF2h
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_f2h {xgl ptF2h deadCopy} call xgl_pt_f2h_new
   Xgl_pt_f2h delete = void call xgl_pt_f2h_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtF2h = proxy_null Xgl_pt_f2h* Xgl_pt_f2h_seal {xgl ptF2h deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_f2h at: unsigned_int = proxy_null Xgl_pt_f2h* Xgl_pt_f2h_seal {xgl ptF2h deadCopy} call xgl_pt_f2h_at
   Xgl_pt_f2h at: unsigned_int Put: Xgl_pt_f2h = void call xgl_pt_f2h_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_f2h w = float getMember w
   Xgl_pt_f2h w: float = void setMember w

   Xgl_pt_f2h x = float getMember x
   Xgl_pt_f2h x: float = void setMember x

   Xgl_pt_f2h y = float getMember y
   Xgl_pt_f2h y: float = void setMember y

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_f2h set_W: float \
	X: float \
	Y: float \
	 = void call xgl_pt_f2h_set


traits: traits xgl raw ptF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_f3d_new
   Xgl_pt_f3d delete = void call xgl_pt_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtF3d = proxy_null Xgl_pt_f3d* Xgl_pt_f3d_seal {xgl ptF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_f3d at: unsigned_int = proxy_null Xgl_pt_f3d* Xgl_pt_f3d_seal {xgl ptF3d deadCopy} call xgl_pt_f3d_at
   Xgl_pt_f3d at: unsigned_int Put: Xgl_pt_f3d = void call xgl_pt_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_f3d x = float getMember x
   Xgl_pt_f3d x: float = void setMember x

   Xgl_pt_f3d y = float getMember y
   Xgl_pt_f3d y: float = void setMember y

   Xgl_pt_f3d z = float getMember z
   Xgl_pt_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_f3d set_X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_f3d_set


traits: traits xgl raw ptF3h
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_f3h {xgl ptF3h deadCopy} call xgl_pt_f3h_new
   Xgl_pt_f3h delete = void call xgl_pt_f3h_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtF3h = proxy_null Xgl_pt_f3h* Xgl_pt_f3h_seal {xgl ptF3h deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_f3h at: unsigned_int = proxy_null Xgl_pt_f3h* Xgl_pt_f3h_seal {xgl ptF3h deadCopy} call xgl_pt_f3h_at
   Xgl_pt_f3h at: unsigned_int Put: Xgl_pt_f3h = void call xgl_pt_f3h_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_f3h w = float getMember w
   Xgl_pt_f3h w: float = void setMember w

   Xgl_pt_f3h x = float getMember x
   Xgl_pt_f3h x: float = void setMember x

   Xgl_pt_f3h y = float getMember y
   Xgl_pt_f3h y: float = void setMember y

   Xgl_pt_f3h z = float getMember z
   Xgl_pt_f3h z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_f3h set_W: float \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_f3h_set


traits: traits xgl raw ptFlagD2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_flag_d2d {xgl ptFlagD2d deadCopy} call xgl_pt_flag_d2d_new
   Xgl_pt_flag_d2d delete = void call xgl_pt_flag_d2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtFlagD2d = proxy_null Xgl_pt_flag_d2d* Xgl_pt_flag_d2d_seal {xgl ptFlagD2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_flag_d2d at: unsigned_int = proxy_null Xgl_pt_flag_d2d* Xgl_pt_flag_d2d_seal {xgl ptFlagD2d deadCopy} call xgl_pt_flag_d2d_at
   Xgl_pt_flag_d2d at: unsigned_int Put: Xgl_pt_flag_d2d = void call xgl_pt_flag_d2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_flag_d2d flag = unsigned_long getMember flag
   Xgl_pt_flag_d2d flag: unsigned_long = void setMember flag

   Xgl_pt_flag_d2d x = double getMember x
   Xgl_pt_flag_d2d x: double = void setMember x

   Xgl_pt_flag_d2d y = double getMember y
   Xgl_pt_flag_d2d y: double = void setMember y

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_flag_d2d set_Flag: unsigned_long \
	X: double \
	Y: double \
	 = void call xgl_pt_flag_d2d_set


traits: traits xgl raw ptFlagD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_flag_d3d {xgl ptFlagD3d deadCopy} call xgl_pt_flag_d3d_new
   Xgl_pt_flag_d3d delete = void call xgl_pt_flag_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtFlagD3d = proxy_null Xgl_pt_flag_d3d* Xgl_pt_flag_d3d_seal {xgl ptFlagD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_flag_d3d at: unsigned_int = proxy_null Xgl_pt_flag_d3d* Xgl_pt_flag_d3d_seal {xgl ptFlagD3d deadCopy} call xgl_pt_flag_d3d_at
   Xgl_pt_flag_d3d at: unsigned_int Put: Xgl_pt_flag_d3d = void call xgl_pt_flag_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_flag_d3d flag = unsigned_long getMember flag
   Xgl_pt_flag_d3d flag: unsigned_long = void setMember flag

   Xgl_pt_flag_d3d x = double getMember x
   Xgl_pt_flag_d3d x: double = void setMember x

   Xgl_pt_flag_d3d y = double getMember y
   Xgl_pt_flag_d3d y: double = void setMember y

   Xgl_pt_flag_d3d z = double getMember z
   Xgl_pt_flag_d3d z: double = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_flag_d3d set_Flag: unsigned_long \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_flag_d3d_set


traits: traits xgl raw ptFlagDataF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_flag_data_f3d {xgl ptFlagDataF3d deadCopy} call xgl_pt_flag_data_f3d_new
   Xgl_pt_flag_data_f3d delete = void call xgl_pt_flag_data_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtFlagDataF3d = proxy_null Xgl_pt_flag_data_f3d* Xgl_pt_flag_data_f3d_seal {xgl ptFlagDataF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_flag_data_f3d at: unsigned_int = proxy_null Xgl_pt_flag_data_f3d* Xgl_pt_flag_data_f3d_seal {xgl ptFlagDataF3d deadCopy} call xgl_pt_flag_data_f3d_at
   Xgl_pt_flag_data_f3d at: unsigned_int Put: Xgl_pt_flag_data_f3d = void call xgl_pt_flag_data_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_flag_data_f3d data = Float_vec_proxy {xgl floatVecProxy deadCopy} call xgl_pt_flag_data_f3d_data

   Xgl_pt_flag_data_f3d flag = unsigned_long getMember flag
   Xgl_pt_flag_data_f3d flag: unsigned_long = void setMember flag

   Xgl_pt_flag_data_f3d x = float getMember x
   Xgl_pt_flag_data_f3d x: float = void setMember x

   Xgl_pt_flag_data_f3d y = float getMember y
   Xgl_pt_flag_data_f3d y: float = void setMember y

   Xgl_pt_flag_data_f3d z = float getMember z
   Xgl_pt_flag_data_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_flag_data_f3d set_Flag: unsigned_long \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_flag_data_f3d_set


traits: traits xgl raw ptFlagF2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_flag_f2d {xgl ptFlagF2d deadCopy} call xgl_pt_flag_f2d_new
   Xgl_pt_flag_f2d delete = void call xgl_pt_flag_f2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtFlagF2d = proxy_null Xgl_pt_flag_f2d* Xgl_pt_flag_f2d_seal {xgl ptFlagF2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_flag_f2d at: unsigned_int = proxy_null Xgl_pt_flag_f2d* Xgl_pt_flag_f2d_seal {xgl ptFlagF2d deadCopy} call xgl_pt_flag_f2d_at
   Xgl_pt_flag_f2d at: unsigned_int Put: Xgl_pt_flag_f2d = void call xgl_pt_flag_f2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_flag_f2d flag = unsigned_long getMember flag
   Xgl_pt_flag_f2d flag: unsigned_long = void setMember flag

   Xgl_pt_flag_f2d x = float getMember x
   Xgl_pt_flag_f2d x: float = void setMember x

   Xgl_pt_flag_f2d y = float getMember y
   Xgl_pt_flag_f2d y: float = void setMember y

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_flag_f2d set_Flag: unsigned_long \
	X: float \
	Y: float \
	 = void call xgl_pt_flag_f2d_set


traits: traits xgl raw ptFlagF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_flag_f3d {xgl ptFlagF3d deadCopy} call xgl_pt_flag_f3d_new
   Xgl_pt_flag_f3d delete = void call xgl_pt_flag_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtFlagF3d = proxy_null Xgl_pt_flag_f3d* Xgl_pt_flag_f3d_seal {xgl ptFlagF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_flag_f3d at: unsigned_int = proxy_null Xgl_pt_flag_f3d* Xgl_pt_flag_f3d_seal {xgl ptFlagF3d deadCopy} call xgl_pt_flag_f3d_at
   Xgl_pt_flag_f3d at: unsigned_int Put: Xgl_pt_flag_f3d = void call xgl_pt_flag_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_flag_f3d flag = unsigned_long getMember flag
   Xgl_pt_flag_f3d flag: unsigned_long = void setMember flag

   Xgl_pt_flag_f3d x = float getMember x
   Xgl_pt_flag_f3d x: float = void setMember x

   Xgl_pt_flag_f3d y = float getMember y
   Xgl_pt_flag_f3d y: float = void setMember y

   Xgl_pt_flag_f3d z = float getMember z
   Xgl_pt_flag_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_flag_f3d set_Flag: unsigned_long \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_flag_f3d_set


traits: traits xgl raw ptFlagI2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_flag_i2d {xgl ptFlagI2d deadCopy} call xgl_pt_flag_i2d_new
   Xgl_pt_flag_i2d delete = void call xgl_pt_flag_i2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtFlagI2d = proxy_null Xgl_pt_flag_i2d* Xgl_pt_flag_i2d_seal {xgl ptFlagI2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_flag_i2d at: unsigned_int = proxy_null Xgl_pt_flag_i2d* Xgl_pt_flag_i2d_seal {xgl ptFlagI2d deadCopy} call xgl_pt_flag_i2d_at
   Xgl_pt_flag_i2d at: unsigned_int Put: Xgl_pt_flag_i2d = void call xgl_pt_flag_i2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_flag_i2d flag = unsigned_long getMember flag
   Xgl_pt_flag_i2d flag: unsigned_long = void setMember flag

   Xgl_pt_flag_i2d x = long getMember x
   Xgl_pt_flag_i2d x: long = void setMember x

   Xgl_pt_flag_i2d y = long getMember y
   Xgl_pt_flag_i2d y: long = void setMember y

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_flag_i2d set_Flag: unsigned_long \
	X: long \
	Y: long \
	 = void call xgl_pt_flag_i2d_set


traits: traits xgl raw ptI2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_i2d {xgl ptI2d deadCopy} call xgl_pt_i2d_new
   Xgl_pt_i2d delete = void call xgl_pt_i2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtI2d = proxy_null Xgl_pt_i2d* Xgl_pt_i2d_seal {xgl ptI2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_i2d at: unsigned_int = proxy_null Xgl_pt_i2d* Xgl_pt_i2d_seal {xgl ptI2d deadCopy} call xgl_pt_i2d_at
   Xgl_pt_i2d at: unsigned_int Put: Xgl_pt_i2d = void call xgl_pt_i2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_i2d x = long getMember x
   Xgl_pt_i2d x: long = void setMember x

   Xgl_pt_i2d y = long getMember y
   Xgl_pt_i2d y: long = void setMember y


traits: traits xgl raw ptI2h
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_i2h {xgl ptI2h deadCopy} call xgl_pt_i2h_new
   Xgl_pt_i2h delete = void call xgl_pt_i2h_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtI2h = proxy_null Xgl_pt_i2h* Xgl_pt_i2h_seal {xgl ptI2h deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_i2h at: unsigned_int = proxy_null Xgl_pt_i2h* Xgl_pt_i2h_seal {xgl ptI2h deadCopy} call xgl_pt_i2h_at
   Xgl_pt_i2h at: unsigned_int Put: Xgl_pt_i2h = void call xgl_pt_i2h_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_i2h w = long getMember w
   Xgl_pt_i2h w: long = void setMember w

   Xgl_pt_i2h x = long getMember x
   Xgl_pt_i2h x: long = void setMember x

   Xgl_pt_i2h y = long getMember y
   Xgl_pt_i2h y: long = void setMember y

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_i2h set_W: long \
	X: long \
	Y: long \
	 = void call xgl_pt_i2h_set

','

traits: traits xgl raw ptList
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_list {xgl ptList deadCopy} call xgl_pt_list_new
   Xgl_pt_list delete = void call xgl_pt_list_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtList = proxy_null Xgl_pt_list* Xgl_pt_list_seal {xgl ptList deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_list at: unsigned_int = proxy_null Xgl_pt_list* Xgl_pt_list_seal {xgl ptList deadCopy} call xgl_pt_list_at
   Xgl_pt_list at: unsigned_int Put: Xgl_pt_list = void call xgl_pt_list_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_list bbox = Xgl_bbox {xgl bbox deadCopy} getMember bbox
   Xgl_pt_list bbox: proxy_null Xgl_bbox* Xgl_bbox_seal = void setMember bbox

   Xgl_pt_list num_data_values = unsigned_long getMember num_data_values
   Xgl_pt_list num_data_values: unsigned_long = void setMember num_data_values

   Xgl_pt_list num_pts = unsigned_long getMember num_pts
   Xgl_pt_list num_pts: unsigned_long = void setMember num_pts

   Xgl_pt_list pt_type = any Xgl_pt_type getMember pt_type
   Xgl_pt_list pt_type: any Xgl_pt_type = void setMember pt_type

   Xgl_pt_list pts_color_d2d = Xgl_pt_color_d2d {xgl ptColorD2d deadCopy} call xgl_pt_list_pts_color_d2d
   Xgl_pt_list pts_color_d2d: proxy_null Xgl_pt_color_d2d* Xgl_pt_color_d2d_seal = void call xgl_pt_list_pts_color_d2d

   Xgl_pt_list pts_color_d3d = Xgl_pt_color_d3d {xgl ptColorD3d deadCopy} call xgl_pt_list_pts_color_d3d
   Xgl_pt_list pts_color_d3d: proxy_null Xgl_pt_color_d3d* Xgl_pt_color_d3d_seal = void call xgl_pt_list_pts_color_d3d

   Xgl_pt_list pts_color_data_f3d = Xgl_pt_color_data_f3d {xgl ptColorDataF3d deadCopy} call xgl_pt_list_pts_color_data_f3d
   Xgl_pt_list pts_color_data_f3d: proxy_null Xgl_pt_color_data_f3d* Xgl_pt_color_data_f3d_seal = void call xgl_pt_list_pts_color_data_f3d

   Xgl_pt_list pts_color_f2d = Xgl_pt_color_f2d {xgl ptColorF2d deadCopy} call xgl_pt_list_pts_color_f2d
   Xgl_pt_list pts_color_f2d: proxy_null Xgl_pt_color_f2d* Xgl_pt_color_f2d_seal = void call xgl_pt_list_pts_color_f2d

   Xgl_pt_list pts_color_f3d = Xgl_pt_color_f3d {xgl ptColorF3d deadCopy} call xgl_pt_list_pts_color_f3d
   Xgl_pt_list pts_color_f3d: proxy_null Xgl_pt_color_f3d* Xgl_pt_color_f3d_seal = void call xgl_pt_list_pts_color_f3d

   Xgl_pt_list pts_color_flag_d3d = Xgl_pt_color_flag_d3d {xgl ptColorFlagD3d deadCopy} call xgl_pt_list_pts_color_flag_d3d
   Xgl_pt_list pts_color_flag_d3d: proxy_null Xgl_pt_color_flag_d3d* Xgl_pt_color_flag_d3d_seal = void call xgl_pt_list_pts_color_flag_d3d

   Xgl_pt_list pts_color_flag_data_f3d = Xgl_pt_color_flag_data_f3d {xgl ptColorFlagDataF3d deadCopy} call xgl_pt_list_pts_color_flag_data_f3d
   Xgl_pt_list pts_color_flag_data_f3d: proxy_null Xgl_pt_color_flag_data_f3d* Xgl_pt_color_flag_data_f3d_seal = void call xgl_pt_list_pts_color_flag_data_f3d

   Xgl_pt_list pts_color_flag_f3d = Xgl_pt_color_flag_f3d {xgl ptColorFlagF3d deadCopy} call xgl_pt_list_pts_color_flag_f3d
   Xgl_pt_list pts_color_flag_f3d: proxy_null Xgl_pt_color_flag_f3d* Xgl_pt_color_flag_f3d_seal = void call xgl_pt_list_pts_color_flag_f3d

   Xgl_pt_list pts_color_i2d = Xgl_pt_color_i2d {xgl ptColorI2d deadCopy} call xgl_pt_list_pts_color_i2d
   Xgl_pt_list pts_color_i2d: proxy_null Xgl_pt_color_i2d* Xgl_pt_color_i2d_seal = void call xgl_pt_list_pts_color_i2d

   Xgl_pt_list pts_color_normal_d3d = Xgl_pt_color_normal_d3d {xgl ptColorNormalD3d deadCopy} call xgl_pt_list_pts_color_normal_d3d
   Xgl_pt_list pts_color_normal_d3d: proxy_null Xgl_pt_color_normal_d3d* Xgl_pt_color_normal_d3d_seal = void call xgl_pt_list_pts_color_normal_d3d

   Xgl_pt_list pts_color_normal_data_f3d = Xgl_pt_color_normal_data_f3d {xgl ptColorNormalDataF3d deadCopy} call xgl_pt_list_pts_color_normal_data_f3d
   Xgl_pt_list pts_color_normal_data_f3d: proxy_null Xgl_pt_color_normal_data_f3d* Xgl_pt_color_normal_data_f3d_seal = void call xgl_pt_list_pts_color_normal_data_f3d

   Xgl_pt_list pts_color_normal_f3d = Xgl_pt_color_normal_f3d {xgl ptColorNormalF3d deadCopy} call xgl_pt_list_pts_color_normal_f3d
   Xgl_pt_list pts_color_normal_f3d: proxy_null Xgl_pt_color_normal_f3d* Xgl_pt_color_normal_f3d_seal = void call xgl_pt_list_pts_color_normal_f3d

   Xgl_pt_list pts_color_normal_flag_d3d = Xgl_pt_color_normal_flag_d3d {xgl ptColorNormalFlagD3d deadCopy} call xgl_pt_list_pts_color_normal_flag_d3d
   Xgl_pt_list pts_color_normal_flag_d3d: proxy_null Xgl_pt_color_normal_flag_d3d* Xgl_pt_color_normal_flag_d3d_seal = void call xgl_pt_list_pts_color_normal_flag_d3d

   Xgl_pt_list pts_color_normal_flag_data_f3d = Xgl_pt_color_normal_flag_data_f3d {xgl ptColorNormalFlagDataF3d deadCopy} call xgl_pt_list_pts_color_normal_flag_data_f3d
   Xgl_pt_list pts_color_normal_flag_data_f3d: proxy_null Xgl_pt_color_normal_flag_data_f3d* Xgl_pt_color_normal_flag_data_f3d_seal = void call xgl_pt_list_pts_color_normal_flag_data_f3d

   Xgl_pt_list pts_color_normal_flag_f3d = Xgl_pt_color_normal_flag_f3d {xgl ptColorNormalFlagF3d deadCopy} call xgl_pt_list_pts_color_normal_flag_f3d
   Xgl_pt_list pts_color_normal_flag_f3d: proxy_null Xgl_pt_color_normal_flag_f3d* Xgl_pt_color_normal_flag_f3d_seal = void call xgl_pt_list_pts_color_normal_flag_f3d

   Xgl_pt_list pts_d2d = Xgl_pt_d2d {xgl ptD2d deadCopy} call xgl_pt_list_pts_d2d
   Xgl_pt_list pts_d2d: proxy_null Xgl_pt_d2d* Xgl_pt_d2d_seal = void call xgl_pt_list_pts_d2d

   Xgl_pt_list pts_d2h = Xgl_pt_d2h {xgl ptD2h deadCopy} call xgl_pt_list_pts_d2h
   Xgl_pt_list pts_d2h: proxy_null Xgl_pt_d2h* Xgl_pt_d2h_seal = void call xgl_pt_list_pts_d2h

   Xgl_pt_list pts_d3d = Xgl_pt_d3d {xgl ptD3d deadCopy} call xgl_pt_list_pts_d3d
   Xgl_pt_list pts_d3d: proxy_null Xgl_pt_d3d* Xgl_pt_d3d_seal = void call xgl_pt_list_pts_d3d

   Xgl_pt_list pts_d3h = Xgl_pt_d3h {xgl ptD3h deadCopy} call xgl_pt_list_pts_d3h
   Xgl_pt_list pts_d3h: proxy_null Xgl_pt_d3h* Xgl_pt_d3h_seal = void call xgl_pt_list_pts_d3h

   Xgl_pt_list pts_data_f3d = Xgl_pt_data_f3d {xgl ptDataF3d deadCopy} call xgl_pt_list_pts_data_f3d
   Xgl_pt_list pts_data_f3d: proxy_null Xgl_pt_data_f3d* Xgl_pt_data_f3d_seal = void call xgl_pt_list_pts_data_f3d

   Xgl_pt_list pts_f2d = Xgl_pt_f2d {xgl ptF2d deadCopy} call xgl_pt_list_pts_f2d
   Xgl_pt_list pts_f2d: proxy_null Xgl_pt_f2d* Xgl_pt_f2d_seal = void call xgl_pt_list_pts_f2d

   Xgl_pt_list pts_f2h = Xgl_pt_f2h {xgl ptF2h deadCopy} call xgl_pt_list_pts_f2h
   Xgl_pt_list pts_f2h: proxy_null Xgl_pt_f2h* Xgl_pt_f2h_seal = void call xgl_pt_list_pts_f2h

   Xgl_pt_list pts_f3d = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_list_pts_f3d
   Xgl_pt_list pts_f3d: proxy_null Xgl_pt_f3d* Xgl_pt_f3d_seal = void call xgl_pt_list_pts_f3d

   Xgl_pt_list pts_f3h = Xgl_pt_f3h {xgl ptF3h deadCopy} call xgl_pt_list_pts_f3h
   Xgl_pt_list pts_f3h: proxy_null Xgl_pt_f3h* Xgl_pt_f3h_seal = void call xgl_pt_list_pts_f3h

   Xgl_pt_list pts_flag_d2d = Xgl_pt_flag_d2d {xgl ptFlagD2d deadCopy} call xgl_pt_list_pts_flag_d2d
   Xgl_pt_list pts_flag_d2d: proxy_null Xgl_pt_flag_d2d* Xgl_pt_flag_d2d_seal = void call xgl_pt_list_pts_flag_d2d

   Xgl_pt_list pts_flag_d3d = Xgl_pt_flag_d3d {xgl ptFlagD3d deadCopy} call xgl_pt_list_pts_flag_d3d
   Xgl_pt_list pts_flag_d3d: proxy_null Xgl_pt_flag_d3d* Xgl_pt_flag_d3d_seal = void call xgl_pt_list_pts_flag_d3d

   Xgl_pt_list pts_flag_data_f3d = Xgl_pt_flag_data_f3d {xgl ptFlagDataF3d deadCopy} call xgl_pt_list_pts_flag_data_f3d
   Xgl_pt_list pts_flag_data_f3d: proxy_null Xgl_pt_flag_data_f3d* Xgl_pt_flag_data_f3d_seal = void call xgl_pt_list_pts_flag_data_f3d

   Xgl_pt_list pts_flag_f2d = Xgl_pt_flag_f2d {xgl ptFlagF2d deadCopy} call xgl_pt_list_pts_flag_f2d
   Xgl_pt_list pts_flag_f2d: proxy_null Xgl_pt_flag_f2d* Xgl_pt_flag_f2d_seal = void call xgl_pt_list_pts_flag_f2d

   Xgl_pt_list pts_flag_f3d = Xgl_pt_flag_f3d {xgl ptFlagF3d deadCopy} call xgl_pt_list_pts_flag_f3d
   Xgl_pt_list pts_flag_f3d: proxy_null Xgl_pt_flag_f3d* Xgl_pt_flag_f3d_seal = void call xgl_pt_list_pts_flag_f3d

   Xgl_pt_list pts_flag_i2d = Xgl_pt_flag_i2d {xgl ptFlagI2d deadCopy} call xgl_pt_list_pts_flag_i2d
   Xgl_pt_list pts_flag_i2d: proxy_null Xgl_pt_flag_i2d* Xgl_pt_flag_i2d_seal = void call xgl_pt_list_pts_flag_i2d

   Xgl_pt_list pts_i2d = Xgl_pt_i2d {xgl ptI2d deadCopy} call xgl_pt_list_pts_i2d
   Xgl_pt_list pts_i2d: proxy_null Xgl_pt_i2d* Xgl_pt_i2d_seal = void call xgl_pt_list_pts_i2d

   Xgl_pt_list pts_i2h = Xgl_pt_i2h {xgl ptI2h deadCopy} call xgl_pt_list_pts_i2h
   Xgl_pt_list pts_i2h: proxy_null Xgl_pt_i2h* Xgl_pt_i2h_seal = void call xgl_pt_list_pts_i2h

   Xgl_pt_list pts_normal_d3d = Xgl_pt_normal_d3d {xgl ptNormalD3d deadCopy} call xgl_pt_list_pts_normal_d3d
   Xgl_pt_list pts_normal_d3d: proxy_null Xgl_pt_normal_d3d* Xgl_pt_normal_d3d_seal = void call xgl_pt_list_pts_normal_d3d

   Xgl_pt_list pts_normal_data_f3d = Xgl_pt_normal_data_f3d {xgl ptNormalDataF3d deadCopy} call xgl_pt_list_pts_normal_data_f3d
   Xgl_pt_list pts_normal_data_f3d: proxy_null Xgl_pt_normal_data_f3d* Xgl_pt_normal_data_f3d_seal = void call xgl_pt_list_pts_normal_data_f3d

   Xgl_pt_list pts_normal_f3d = Xgl_pt_normal_f3d {xgl ptNormalF3d deadCopy} call xgl_pt_list_pts_normal_f3d
   Xgl_pt_list pts_normal_f3d: proxy_null Xgl_pt_normal_f3d* Xgl_pt_normal_f3d_seal = void call xgl_pt_list_pts_normal_f3d

   Xgl_pt_list pts_normal_flag_d3d = Xgl_pt_normal_flag_d3d {xgl ptNormalFlagD3d deadCopy} call xgl_pt_list_pts_normal_flag_d3d
   Xgl_pt_list pts_normal_flag_d3d: proxy_null Xgl_pt_normal_flag_d3d* Xgl_pt_normal_flag_d3d_seal = void call xgl_pt_list_pts_normal_flag_d3d

   Xgl_pt_list pts_normal_flag_data_f3d = Xgl_pt_normal_flag_data_f3d {xgl ptNormalFlagDataF3d deadCopy} call xgl_pt_list_pts_normal_flag_data_f3d
   Xgl_pt_list pts_normal_flag_data_f3d: proxy_null Xgl_pt_normal_flag_data_f3d* Xgl_pt_normal_flag_data_f3d_seal = void call xgl_pt_list_pts_normal_flag_data_f3d

   Xgl_pt_list pts_normal_flag_f3d = Xgl_pt_normal_flag_f3d {xgl ptNormalFlagF3d deadCopy} call xgl_pt_list_pts_normal_flag_f3d
   Xgl_pt_list pts_normal_flag_f3d: proxy_null Xgl_pt_normal_flag_f3d* Xgl_pt_normal_flag_f3d_seal = void call xgl_pt_list_pts_normal_flag_f3d

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_d2d: proxy_null Xgl_pt_color_d2d* Xgl_pt_color_d2d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_d3d: proxy_null Xgl_pt_color_d3d* Xgl_pt_color_d3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_data_f3d: proxy_null Xgl_pt_color_data_f3d* Xgl_pt_color_data_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_f2d: proxy_null Xgl_pt_color_f2d* Xgl_pt_color_f2d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_f3d: proxy_null Xgl_pt_color_f3d* Xgl_pt_color_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_flag_d3d: proxy_null Xgl_pt_color_flag_d3d* Xgl_pt_color_flag_d3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_flag_data_f3d: proxy_null Xgl_pt_color_flag_data_f3d* Xgl_pt_color_flag_data_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_flag_f3d: proxy_null Xgl_pt_color_flag_f3d* Xgl_pt_color_flag_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_i2d: proxy_null Xgl_pt_color_i2d* Xgl_pt_color_i2d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_normal_d3d: proxy_null Xgl_pt_color_normal_d3d* Xgl_pt_color_normal_d3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_normal_data_f3d: proxy_null Xgl_pt_color_normal_data_f3d* Xgl_pt_color_normal_data_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_normal_f3d: proxy_null Xgl_pt_color_normal_f3d* Xgl_pt_color_normal_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_normal_flag_d3d: proxy_null Xgl_pt_color_normal_flag_d3d* Xgl_pt_color_normal_flag_d3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_normal_flag_data_f3d: proxy_null Xgl_pt_color_normal_flag_data_f3d* Xgl_pt_color_normal_flag_data_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_color_normal_flag_f3d: proxy_null Xgl_pt_color_normal_flag_f3d* Xgl_pt_color_normal_flag_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_d2d: proxy_null Xgl_pt_d2d* Xgl_pt_d2d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_d2h: proxy_null Xgl_pt_d2h* Xgl_pt_d2h_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_d3d: proxy_null Xgl_pt_d3d* Xgl_pt_d3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_d3h: proxy_null Xgl_pt_d3h* Xgl_pt_d3h_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_data_f3d: proxy_null Xgl_pt_data_f3d* Xgl_pt_data_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_f2d: proxy_null Xgl_pt_f2d* Xgl_pt_f2d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_f2h: proxy_null Xgl_pt_f2h* Xgl_pt_f2h_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_f3d: proxy_null Xgl_pt_f3d* Xgl_pt_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_f3h: proxy_null Xgl_pt_f3h* Xgl_pt_f3h_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_flag_d2d: proxy_null Xgl_pt_flag_d2d* Xgl_pt_flag_d2d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_flag_d3d: proxy_null Xgl_pt_flag_d3d* Xgl_pt_flag_d3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_flag_data_f3d: proxy_null Xgl_pt_flag_data_f3d* Xgl_pt_flag_data_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_flag_f2d: proxy_null Xgl_pt_flag_f2d* Xgl_pt_flag_f2d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_flag_f3d: proxy_null Xgl_pt_flag_f3d* Xgl_pt_flag_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_flag_i2d: proxy_null Xgl_pt_flag_i2d* Xgl_pt_flag_i2d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_i2d: proxy_null Xgl_pt_i2d* Xgl_pt_i2d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_i2h: proxy_null Xgl_pt_i2h* Xgl_pt_i2h_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_normal_d3d: proxy_null Xgl_pt_normal_d3d* Xgl_pt_normal_d3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_normal_data_f3d: proxy_null Xgl_pt_normal_data_f3d* Xgl_pt_normal_data_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_normal_f3d: proxy_null Xgl_pt_normal_f3d* Xgl_pt_normal_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_normal_flag_d3d: proxy_null Xgl_pt_normal_flag_d3d* Xgl_pt_normal_flag_d3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_normal_flag_data_f3d: proxy_null Xgl_pt_normal_flag_data_f3d* Xgl_pt_normal_flag_data_f3d_seal \
	 = void call xgl_pt_list_set

   Xgl_pt_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_data_values: unsigned_long \
	Num_pts: unsigned_long \
	Pt_type: any Xgl_pt_type \
	Pts_normal_flag_f3d: proxy_null Xgl_pt_normal_flag_f3d* Xgl_pt_normal_flag_f3d_seal \
	 = void call xgl_pt_list_set


traits: traits xgl raw ptListList
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_list_list {xgl ptListList deadCopy} call xgl_pt_list_list_new
   Xgl_pt_list_list delete = void call xgl_pt_list_list_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtListList = proxy_null Xgl_pt_list_list* Xgl_pt_list_list_seal {xgl ptListList deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_list_list at: unsigned_int = proxy_null Xgl_pt_list_list* Xgl_pt_list_list_seal {xgl ptListList deadCopy} call xgl_pt_list_list_at
   Xgl_pt_list_list at: unsigned_int Put: Xgl_pt_list_list = void call xgl_pt_list_list_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_list_list bbox = Xgl_bbox {xgl bbox deadCopy} getMember bbox
   Xgl_pt_list_list bbox: proxy_null Xgl_bbox* Xgl_bbox_seal = void setMember bbox

   Xgl_pt_list_list num_pt_lists = unsigned_long getMember num_pt_lists
   Xgl_pt_list_list num_pt_lists: unsigned_long = void setMember num_pt_lists

   Xgl_pt_list_list pt_lists = Xgl_pt_list {xgl ptList deadCopy} getMember pt_lists
   Xgl_pt_list_list pt_lists: proxy_null Xgl_pt_list* Xgl_pt_list_seal = void setMember pt_lists

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_list_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_pt_lists: unsigned_long \
	Pt_lists: proxy_null Xgl_pt_list* Xgl_pt_list_seal \
	 = void call xgl_pt_list_list_set


traits: traits xgl raw ptNormalD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_normal_d3d {xgl ptNormalD3d deadCopy} call xgl_pt_normal_d3d_new
   Xgl_pt_normal_d3d delete = void call xgl_pt_normal_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtNormalD3d = proxy_null Xgl_pt_normal_d3d* Xgl_pt_normal_d3d_seal {xgl ptNormalD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_normal_d3d at: unsigned_int = proxy_null Xgl_pt_normal_d3d* Xgl_pt_normal_d3d_seal {xgl ptNormalD3d deadCopy} call xgl_pt_normal_d3d_at
   Xgl_pt_normal_d3d at: unsigned_int Put: Xgl_pt_normal_d3d = void call xgl_pt_normal_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_normal_d3d normal = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_normal_d3d_normal
   Xgl_pt_normal_d3d normal: Xgl_pt_f3d = void call xgl_pt_normal_d3d_normal

   Xgl_pt_normal_d3d x = double getMember x
   Xgl_pt_normal_d3d x: double = void setMember x

   Xgl_pt_normal_d3d y = double getMember y
   Xgl_pt_normal_d3d y: double = void setMember y

   Xgl_pt_normal_d3d z = double getMember z
   Xgl_pt_normal_d3d z: double = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_normal_d3d set_Normal: Xgl_pt_f3d \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_normal_d3d_set


traits: traits xgl raw ptNormalDataF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_normal_data_f3d {xgl ptNormalDataF3d deadCopy} call xgl_pt_normal_data_f3d_new
   Xgl_pt_normal_data_f3d delete = void call xgl_pt_normal_data_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtNormalDataF3d = proxy_null Xgl_pt_normal_data_f3d* Xgl_pt_normal_data_f3d_seal {xgl ptNormalDataF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_normal_data_f3d at: unsigned_int = proxy_null Xgl_pt_normal_data_f3d* Xgl_pt_normal_data_f3d_seal {xgl ptNormalDataF3d deadCopy} call xgl_pt_normal_data_f3d_at
   Xgl_pt_normal_data_f3d at: unsigned_int Put: Xgl_pt_normal_data_f3d = void call xgl_pt_normal_data_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_normal_data_f3d data = Float_vec_proxy {xgl floatVecProxy deadCopy} call xgl_pt_normal_data_f3d_data

   Xgl_pt_normal_data_f3d normal = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_normal_data_f3d_normal
   Xgl_pt_normal_data_f3d normal: Xgl_pt_f3d = void call xgl_pt_normal_data_f3d_normal

   Xgl_pt_normal_data_f3d x = float getMember x
   Xgl_pt_normal_data_f3d x: float = void setMember x

   Xgl_pt_normal_data_f3d y = float getMember y
   Xgl_pt_normal_data_f3d y: float = void setMember y

   Xgl_pt_normal_data_f3d z = float getMember z
   Xgl_pt_normal_data_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_normal_data_f3d set_Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_normal_data_f3d_set


traits: traits xgl raw ptNormalF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_normal_f3d {xgl ptNormalF3d deadCopy} call xgl_pt_normal_f3d_new
   Xgl_pt_normal_f3d delete = void call xgl_pt_normal_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtNormalF3d = proxy_null Xgl_pt_normal_f3d* Xgl_pt_normal_f3d_seal {xgl ptNormalF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_normal_f3d at: unsigned_int = proxy_null Xgl_pt_normal_f3d* Xgl_pt_normal_f3d_seal {xgl ptNormalF3d deadCopy} call xgl_pt_normal_f3d_at
   Xgl_pt_normal_f3d at: unsigned_int Put: Xgl_pt_normal_f3d = void call xgl_pt_normal_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_normal_f3d normal = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_normal_f3d_normal
   Xgl_pt_normal_f3d normal: Xgl_pt_f3d = void call xgl_pt_normal_f3d_normal

   Xgl_pt_normal_f3d x = float getMember x
   Xgl_pt_normal_f3d x: float = void setMember x

   Xgl_pt_normal_f3d y = float getMember y
   Xgl_pt_normal_f3d y: float = void setMember y

   Xgl_pt_normal_f3d z = float getMember z
   Xgl_pt_normal_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_normal_f3d set_Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_normal_f3d_set


traits: traits xgl raw ptNormalFlagD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_normal_flag_d3d {xgl ptNormalFlagD3d deadCopy} call xgl_pt_normal_flag_d3d_new
   Xgl_pt_normal_flag_d3d delete = void call xgl_pt_normal_flag_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtNormalFlagD3d = proxy_null Xgl_pt_normal_flag_d3d* Xgl_pt_normal_flag_d3d_seal {xgl ptNormalFlagD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_normal_flag_d3d at: unsigned_int = proxy_null Xgl_pt_normal_flag_d3d* Xgl_pt_normal_flag_d3d_seal {xgl ptNormalFlagD3d deadCopy} call xgl_pt_normal_flag_d3d_at
   Xgl_pt_normal_flag_d3d at: unsigned_int Put: Xgl_pt_normal_flag_d3d = void call xgl_pt_normal_flag_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_normal_flag_d3d flag = unsigned_long getMember flag
   Xgl_pt_normal_flag_d3d flag: unsigned_long = void setMember flag

   Xgl_pt_normal_flag_d3d normal = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_normal_flag_d3d_normal
   Xgl_pt_normal_flag_d3d normal: Xgl_pt_f3d = void call xgl_pt_normal_flag_d3d_normal

   Xgl_pt_normal_flag_d3d x = double getMember x
   Xgl_pt_normal_flag_d3d x: double = void setMember x

   Xgl_pt_normal_flag_d3d y = double getMember y
   Xgl_pt_normal_flag_d3d y: double = void setMember y

   Xgl_pt_normal_flag_d3d z = double getMember z
   Xgl_pt_normal_flag_d3d z: double = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_normal_flag_d3d set_Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: double \
	Y: double \
	Z: double \
	 = void call xgl_pt_normal_flag_d3d_set


traits: traits xgl raw ptNormalFlagDataF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_normal_flag_data_f3d {xgl ptNormalFlagDataF3d deadCopy} call xgl_pt_normal_flag_data_f3d_new
   Xgl_pt_normal_flag_data_f3d delete = void call xgl_pt_normal_flag_data_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtNormalFlagDataF3d = proxy_null Xgl_pt_normal_flag_data_f3d* Xgl_pt_normal_flag_data_f3d_seal {xgl ptNormalFlagDataF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_normal_flag_data_f3d at: unsigned_int = proxy_null Xgl_pt_normal_flag_data_f3d* Xgl_pt_normal_flag_data_f3d_seal {xgl ptNormalFlagDataF3d deadCopy} call xgl_pt_normal_flag_data_f3d_at
   Xgl_pt_normal_flag_data_f3d at: unsigned_int Put: Xgl_pt_normal_flag_data_f3d = void call xgl_pt_normal_flag_data_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_normal_flag_data_f3d data = Float_vec_proxy {xgl floatVecProxy deadCopy} call xgl_pt_normal_flag_data_f3d_data

   Xgl_pt_normal_flag_data_f3d flag = unsigned_long getMember flag
   Xgl_pt_normal_flag_data_f3d flag: unsigned_long = void setMember flag

   Xgl_pt_normal_flag_data_f3d normal = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_normal_flag_data_f3d_normal
   Xgl_pt_normal_flag_data_f3d normal: Xgl_pt_f3d = void call xgl_pt_normal_flag_data_f3d_normal

   Xgl_pt_normal_flag_data_f3d x = float getMember x
   Xgl_pt_normal_flag_data_f3d x: float = void setMember x

   Xgl_pt_normal_flag_data_f3d y = float getMember y
   Xgl_pt_normal_flag_data_f3d y: float = void setMember y

   Xgl_pt_normal_flag_data_f3d z = float getMember z
   Xgl_pt_normal_flag_data_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_normal_flag_data_f3d set_Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_normal_flag_data_f3d_set


traits: traits xgl raw ptNormalFlagF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_normal_flag_f3d {xgl ptNormalFlagF3d deadCopy} call xgl_pt_normal_flag_f3d_new
   Xgl_pt_normal_flag_f3d delete = void call xgl_pt_normal_flag_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtNormalFlagF3d = proxy_null Xgl_pt_normal_flag_f3d* Xgl_pt_normal_flag_f3d_seal {xgl ptNormalFlagF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_normal_flag_f3d at: unsigned_int = proxy_null Xgl_pt_normal_flag_f3d* Xgl_pt_normal_flag_f3d_seal {xgl ptNormalFlagF3d deadCopy} call xgl_pt_normal_flag_f3d_at
   Xgl_pt_normal_flag_f3d at: unsigned_int Put: Xgl_pt_normal_flag_f3d = void call xgl_pt_normal_flag_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_normal_flag_f3d flag = unsigned_long getMember flag
   Xgl_pt_normal_flag_f3d flag: unsigned_long = void setMember flag

   Xgl_pt_normal_flag_f3d normal = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_pt_normal_flag_f3d_normal
   Xgl_pt_normal_flag_f3d normal: Xgl_pt_f3d = void call xgl_pt_normal_flag_f3d_normal

   Xgl_pt_normal_flag_f3d x = float getMember x
   Xgl_pt_normal_flag_f3d x: float = void setMember x

   Xgl_pt_normal_flag_f3d y = float getMember y
   Xgl_pt_normal_flag_f3d y: float = void setMember y

   Xgl_pt_normal_flag_f3d z = float getMember z
   Xgl_pt_normal_flag_f3d z: float = void setMember z

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_normal_flag_f3d set_Flag: unsigned_long \
	Normal: Xgl_pt_f3d \
	X: float \
	Y: float \
	Z: float \
	 = void call xgl_pt_normal_flag_f3d_set


traits: traits xgl raw ptTypeSupported
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_pt_type_supported {xgl ptTypeSupported deadCopy} call xgl_pt_type_supported_new
   Xgl_pt_type_supported delete = void call xgl_pt_type_supported_delete

  -- create nil proxy
  visibility: publicSlot
   void nilPtTypeSupported = proxy_null Xgl_pt_type_supported* Xgl_pt_type_supported_seal {xgl ptTypeSupported deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_pt_type_supported at: unsigned_int = proxy_null Xgl_pt_type_supported* Xgl_pt_type_supported_seal {xgl ptTypeSupported deadCopy} call xgl_pt_type_supported_at
   Xgl_pt_type_supported at: unsigned_int Put: Xgl_pt_type_supported = void call xgl_pt_type_supported_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_pt_type_supported pt_dim_2d = unsigned_int getMember pt_dim_2d
   Xgl_pt_type_supported pt_dim_2d: unsigned_int = void setMember pt_dim_2d

   Xgl_pt_type_supported pt_dim_3d = unsigned_int getMember pt_dim_3d
   Xgl_pt_type_supported pt_dim_3d: unsigned_int = void setMember pt_dim_3d

   Xgl_pt_type_supported pt_type_double = unsigned_int getMember pt_type_double
   Xgl_pt_type_supported pt_type_double: unsigned_int = void setMember pt_type_double

   Xgl_pt_type_supported pt_type_float = unsigned_int getMember pt_type_float
   Xgl_pt_type_supported pt_type_float: unsigned_int = void setMember pt_type_float

   Xgl_pt_type_supported pt_type_int = unsigned_int getMember pt_type_int
   Xgl_pt_type_supported pt_type_int: unsigned_int = void setMember pt_type_int

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_pt_type_supported set_Pt_dim_2d: unsigned_int \
	Pt_dim_3d: unsigned_int \
	Pt_type_double: unsigned_int \
	Pt_type_float: unsigned_int \
	Pt_type_int: unsigned_int \
	 = void call xgl_pt_type_supported_set


traits: traits xgl raw rectAd3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_rect_ad3d {xgl rectAd3d deadCopy} call xgl_rect_ad3d_new
   Xgl_rect_ad3d delete = void call xgl_rect_ad3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilRectAd3d = proxy_null Xgl_rect_ad3d* Xgl_rect_ad3d_seal {xgl rectAd3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_rect_ad3d at: unsigned_int = proxy_null Xgl_rect_ad3d* Xgl_rect_ad3d_seal {xgl rectAd3d deadCopy} call xgl_rect_ad3d_at
   Xgl_rect_ad3d at: unsigned_int Put: Xgl_rect_ad3d = void call xgl_rect_ad3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_rect_ad3d corner_max = Xgl_pt_d2d {xgl ptD2d deadCopy} call xgl_rect_ad3d_corner_max
   Xgl_rect_ad3d corner_max: Xgl_pt_d2d = void call xgl_rect_ad3d_corner_max

   Xgl_rect_ad3d corner_min = Xgl_pt_flag_d3d {xgl ptFlagD3d deadCopy} call xgl_rect_ad3d_corner_min
   Xgl_rect_ad3d corner_min: Xgl_pt_flag_d3d = void call xgl_rect_ad3d_corner_min


traits: traits xgl raw rectAf3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_rect_af3d {xgl rectAf3d deadCopy} call xgl_rect_af3d_new
   Xgl_rect_af3d delete = void call xgl_rect_af3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilRectAf3d = proxy_null Xgl_rect_af3d* Xgl_rect_af3d_seal {xgl rectAf3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_rect_af3d at: unsigned_int = proxy_null Xgl_rect_af3d* Xgl_rect_af3d_seal {xgl rectAf3d deadCopy} call xgl_rect_af3d_at
   Xgl_rect_af3d at: unsigned_int Put: Xgl_rect_af3d = void call xgl_rect_af3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_rect_af3d corner_max = Xgl_pt_f2d {xgl ptF2d deadCopy} call xgl_rect_af3d_corner_max
   Xgl_rect_af3d corner_max: Xgl_pt_f2d = void call xgl_rect_af3d_corner_max

   Xgl_rect_af3d corner_min = Xgl_pt_flag_f3d {xgl ptFlagF3d deadCopy} call xgl_rect_af3d_corner_min
   Xgl_rect_af3d corner_min: Xgl_pt_flag_f3d = void call xgl_rect_af3d_corner_min


traits: traits xgl raw rectD2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_rect_d2d {xgl rectD2d deadCopy} call xgl_rect_d2d_new
   Xgl_rect_d2d delete = void call xgl_rect_d2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilRectD2d = proxy_null Xgl_rect_d2d* Xgl_rect_d2d_seal {xgl rectD2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_rect_d2d at: unsigned_int = proxy_null Xgl_rect_d2d* Xgl_rect_d2d_seal {xgl rectD2d deadCopy} call xgl_rect_d2d_at
   Xgl_rect_d2d at: unsigned_int Put: Xgl_rect_d2d = void call xgl_rect_d2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_rect_d2d corner_max = Xgl_pt_d2d {xgl ptD2d deadCopy} call xgl_rect_d2d_corner_max
   Xgl_rect_d2d corner_max: Xgl_pt_d2d = void call xgl_rect_d2d_corner_max

   Xgl_rect_d2d corner_min = Xgl_pt_flag_d2d {xgl ptFlagD2d deadCopy} call xgl_rect_d2d_corner_min
   Xgl_rect_d2d corner_min: Xgl_pt_flag_d2d = void call xgl_rect_d2d_corner_min


traits: traits xgl raw rectD3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_rect_d3d {xgl rectD3d deadCopy} call xgl_rect_d3d_new
   Xgl_rect_d3d delete = void call xgl_rect_d3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilRectD3d = proxy_null Xgl_rect_d3d* Xgl_rect_d3d_seal {xgl rectD3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_rect_d3d at: unsigned_int = proxy_null Xgl_rect_d3d* Xgl_rect_d3d_seal {xgl rectD3d deadCopy} call xgl_rect_d3d_at
   Xgl_rect_d3d at: unsigned_int Put: Xgl_rect_d3d = void call xgl_rect_d3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_rect_d3d corner_max = Xgl_pt_d2d {xgl ptD2d deadCopy} call xgl_rect_d3d_corner_max
   Xgl_rect_d3d corner_max: Xgl_pt_d2d = void call xgl_rect_d3d_corner_max

   Xgl_rect_d3d corner_min = Xgl_pt_flag_d3d {xgl ptFlagD3d deadCopy} call xgl_rect_d3d_corner_min
   Xgl_rect_d3d corner_min: Xgl_pt_flag_d3d = void call xgl_rect_d3d_corner_min

   Xgl_rect_d3d dir = Xgl_pt_d3d {xgl ptD3d deadCopy} call xgl_rect_d3d_dir

   Xgl_rect_d3d dir_normal = bool getMember dir_normal
   Xgl_rect_d3d dir_normal: bool = void setMember dir_normal

   Xgl_rect_d3d dir_normalized = bool getMember dir_normalized
   Xgl_rect_d3d dir_normalized: bool = void setMember dir_normalized

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_rect_d3d set_Corner_max: Xgl_pt_d2d \
	Corner_min: Xgl_pt_flag_d3d \
	Dir_normal: bool \
	Dir_normalized: bool \
	 = void call xgl_rect_d3d_set


traits: traits xgl raw rectF2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_rect_f2d {xgl rectF2d deadCopy} call xgl_rect_f2d_new
   Xgl_rect_f2d delete = void call xgl_rect_f2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilRectF2d = proxy_null Xgl_rect_f2d* Xgl_rect_f2d_seal {xgl rectF2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_rect_f2d at: unsigned_int = proxy_null Xgl_rect_f2d* Xgl_rect_f2d_seal {xgl rectF2d deadCopy} call xgl_rect_f2d_at
   Xgl_rect_f2d at: unsigned_int Put: Xgl_rect_f2d = void call xgl_rect_f2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_rect_f2d corner_max = Xgl_pt_f2d {xgl ptF2d deadCopy} call xgl_rect_f2d_corner_max
   Xgl_rect_f2d corner_max: Xgl_pt_f2d = void call xgl_rect_f2d_corner_max

   Xgl_rect_f2d corner_min = Xgl_pt_flag_f2d {xgl ptFlagF2d deadCopy} call xgl_rect_f2d_corner_min
   Xgl_rect_f2d corner_min: Xgl_pt_flag_f2d = void call xgl_rect_f2d_corner_min


traits: traits xgl raw rectF3d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_rect_f3d {xgl rectF3d deadCopy} call xgl_rect_f3d_new
   Xgl_rect_f3d delete = void call xgl_rect_f3d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilRectF3d = proxy_null Xgl_rect_f3d* Xgl_rect_f3d_seal {xgl rectF3d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_rect_f3d at: unsigned_int = proxy_null Xgl_rect_f3d* Xgl_rect_f3d_seal {xgl rectF3d deadCopy} call xgl_rect_f3d_at
   Xgl_rect_f3d at: unsigned_int Put: Xgl_rect_f3d = void call xgl_rect_f3d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_rect_f3d corner_max = Xgl_pt_f2d {xgl ptF2d deadCopy} call xgl_rect_f3d_corner_max
   Xgl_rect_f3d corner_max: Xgl_pt_f2d = void call xgl_rect_f3d_corner_max

   Xgl_rect_f3d corner_min = Xgl_pt_flag_f3d {xgl ptFlagF3d deadCopy} call xgl_rect_f3d_corner_min
   Xgl_rect_f3d corner_min: Xgl_pt_flag_f3d = void call xgl_rect_f3d_corner_min

   Xgl_rect_f3d dir = Xgl_pt_f3d {xgl ptF3d deadCopy} call xgl_rect_f3d_dir

   Xgl_rect_f3d dir_normal = bool getMember dir_normal
   Xgl_rect_f3d dir_normal: bool = void setMember dir_normal

   Xgl_rect_f3d dir_normalized = bool getMember dir_normalized
   Xgl_rect_f3d dir_normalized: bool = void setMember dir_normalized

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_rect_f3d set_Corner_max: Xgl_pt_f2d \
	Corner_min: Xgl_pt_flag_f3d \
	Dir_normal: bool \
	Dir_normalized: bool \
	 = void call xgl_rect_f3d_set


traits: traits xgl raw rectI2d
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_rect_i2d {xgl rectI2d deadCopy} call xgl_rect_i2d_new
   Xgl_rect_i2d delete = void call xgl_rect_i2d_delete

  -- create nil proxy
  visibility: publicSlot
   void nilRectI2d = proxy_null Xgl_rect_i2d* Xgl_rect_i2d_seal {xgl rectI2d deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_rect_i2d at: unsigned_int = proxy_null Xgl_rect_i2d* Xgl_rect_i2d_seal {xgl rectI2d deadCopy} call xgl_rect_i2d_at
   Xgl_rect_i2d at: unsigned_int Put: Xgl_rect_i2d = void call xgl_rect_i2d_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_rect_i2d corner_max = Xgl_pt_i2d {xgl ptI2d deadCopy} call xgl_rect_i2d_corner_max
   Xgl_rect_i2d corner_max: Xgl_pt_i2d = void call xgl_rect_i2d_corner_max

   Xgl_rect_i2d corner_min = Xgl_pt_flag_i2d {xgl ptFlagI2d deadCopy} call xgl_rect_i2d_corner_min
   Xgl_rect_i2d corner_min: Xgl_pt_flag_i2d = void call xgl_rect_i2d_corner_min


traits: traits xgl raw rectList
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_rect_list {xgl rectList deadCopy} call xgl_rect_list_new
   Xgl_rect_list delete = void call xgl_rect_list_delete

  -- create nil proxy
  visibility: publicSlot
   void nilRectList = proxy_null Xgl_rect_list* Xgl_rect_list_seal {xgl rectList deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_rect_list at: unsigned_int = proxy_null Xgl_rect_list* Xgl_rect_list_seal {xgl rectList deadCopy} call xgl_rect_list_at
   Xgl_rect_list at: unsigned_int Put: Xgl_rect_list = void call xgl_rect_list_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_rect_list bbox = Xgl_bbox {xgl bbox deadCopy} getMember bbox
   Xgl_rect_list bbox: proxy_null Xgl_bbox* Xgl_bbox_seal = void setMember bbox

   Xgl_rect_list num_rects = unsigned_long getMember num_rects
   Xgl_rect_list num_rects: unsigned_long = void setMember num_rects

   Xgl_rect_list rect_type = any Xgl_multirect_type getMember rect_type
   Xgl_rect_list rect_type: any Xgl_multirect_type = void setMember rect_type

   Xgl_rect_list rects_ad3d = Xgl_rect_ad3d {xgl rectAd3d deadCopy} call xgl_rect_list_rects_ad3d
   Xgl_rect_list rects_ad3d: proxy_null Xgl_rect_ad3d* Xgl_rect_ad3d_seal = void call xgl_rect_list_rects_ad3d

   Xgl_rect_list rects_af3d = Xgl_rect_af3d {xgl rectAf3d deadCopy} call xgl_rect_list_rects_af3d
   Xgl_rect_list rects_af3d: proxy_null Xgl_rect_af3d* Xgl_rect_af3d_seal = void call xgl_rect_list_rects_af3d

   Xgl_rect_list rects_d2d = Xgl_rect_d2d {xgl rectD2d deadCopy} call xgl_rect_list_rects_d2d
   Xgl_rect_list rects_d2d: proxy_null Xgl_rect_d2d* Xgl_rect_d2d_seal = void call xgl_rect_list_rects_d2d

   Xgl_rect_list rects_d3d = Xgl_rect_d3d {xgl rectD3d deadCopy} call xgl_rect_list_rects_d3d
   Xgl_rect_list rects_d3d: proxy_null Xgl_rect_d3d* Xgl_rect_d3d_seal = void call xgl_rect_list_rects_d3d

   Xgl_rect_list rects_f2d = Xgl_rect_f2d {xgl rectF2d deadCopy} call xgl_rect_list_rects_f2d
   Xgl_rect_list rects_f2d: proxy_null Xgl_rect_f2d* Xgl_rect_f2d_seal = void call xgl_rect_list_rects_f2d

   Xgl_rect_list rects_f3d = Xgl_rect_f3d {xgl rectF3d deadCopy} call xgl_rect_list_rects_f3d
   Xgl_rect_list rects_f3d: proxy_null Xgl_rect_f3d* Xgl_rect_f3d_seal = void call xgl_rect_list_rects_f3d

   Xgl_rect_list rects_i2d = Xgl_rect_i2d {xgl rectI2d deadCopy} call xgl_rect_list_rects_i2d
   Xgl_rect_list rects_i2d: proxy_null Xgl_rect_i2d* Xgl_rect_i2d_seal = void call xgl_rect_list_rects_i2d

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_rect_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_rects: unsigned_long \
	Rect_type: any Xgl_multirect_type \
	Rects_ad3d: proxy_null Xgl_rect_ad3d* Xgl_rect_ad3d_seal \
	 = void call xgl_rect_list_set

   Xgl_rect_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_rects: unsigned_long \
	Rect_type: any Xgl_multirect_type \
	Rects_af3d: proxy_null Xgl_rect_af3d* Xgl_rect_af3d_seal \
	 = void call xgl_rect_list_set

   Xgl_rect_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_rects: unsigned_long \
	Rect_type: any Xgl_multirect_type \
	Rects_d2d: proxy_null Xgl_rect_d2d* Xgl_rect_d2d_seal \
	 = void call xgl_rect_list_set

   Xgl_rect_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_rects: unsigned_long \
	Rect_type: any Xgl_multirect_type \
	Rects_d3d: proxy_null Xgl_rect_d3d* Xgl_rect_d3d_seal \
	 = void call xgl_rect_list_set

   Xgl_rect_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_rects: unsigned_long \
	Rect_type: any Xgl_multirect_type \
	Rects_f2d: proxy_null Xgl_rect_f2d* Xgl_rect_f2d_seal \
	 = void call xgl_rect_list_set

   Xgl_rect_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_rects: unsigned_long \
	Rect_type: any Xgl_multirect_type \
	Rects_f3d: proxy_null Xgl_rect_f3d* Xgl_rect_f3d_seal \
	 = void call xgl_rect_list_set

   Xgl_rect_list set_Bbox: proxy_null Xgl_bbox* Xgl_bbox_seal \
	Num_rects: unsigned_long \
	Rect_type: any Xgl_multirect_type \
	Rects_i2d: proxy_null Xgl_rect_i2d* Xgl_rect_i2d_seal \
	 = void call xgl_rect_list_set

','

traits: traits xgl raw renderComponentDesc
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_render_component_desc {xgl renderComponentDesc deadCopy} call xgl_render_component_desc_new
   Xgl_render_component_desc delete = void call xgl_render_component_desc_delete

  -- create nil proxy
  visibility: publicSlot
   void nilRenderComponentDesc = proxy_null Xgl_render_component_desc* Xgl_render_component_desc_seal {xgl renderComponentDesc deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_render_component_desc at: unsigned_int = proxy_null Xgl_render_component_desc* Xgl_render_component_desc_seal {xgl renderComponentDesc deadCopy} call xgl_render_component_desc_at
   Xgl_render_component_desc at: unsigned_int Put: Xgl_render_component_desc = void call xgl_render_component_desc_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_render_component_desc comp = any Xgl_render_component getMember comp
   Xgl_render_component_desc comp: any Xgl_render_component = void setMember comp

   Xgl_render_component_desc op_blend_rgb = Xgl_texture_blend_rgb {xgl textureBlendRgb deadCopy} call xgl_render_component_desc_op_blend_rgb
   Xgl_render_component_desc op_blend_rgb: Xgl_texture_blend_rgb = void call xgl_render_component_desc_op_blend_rgb

   Xgl_render_component_desc op_decal_rgb = Xgl_texture_decal_rgb {xgl textureDecalRgb deadCopy} call xgl_render_component_desc_op_decal_rgb
   Xgl_render_component_desc op_decal_rgb: Xgl_texture_decal_rgb = void call xgl_render_component_desc_op_decal_rgb

   Xgl_render_component_desc texture_op = any Xgl_texture_op getMember texture_op
   Xgl_render_component_desc texture_op: any Xgl_texture_op = void setMember texture_op

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_render_component_desc set_Comp: any Xgl_render_component \
	Op_blend_rgb: Xgl_texture_blend_rgb \
	Texture_op: any Xgl_texture_op \
	 = void call xgl_render_component_desc_set

   Xgl_render_component_desc set_Comp: any Xgl_render_component \
	Op_decal_rgb: Xgl_texture_decal_rgb \
	Texture_op: any Xgl_texture_op \
	 = void call xgl_render_component_desc_set


traits: traits xgl raw segment
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_segment {xgl segment deadCopy} call xgl_segment_new
   Xgl_segment delete = void call xgl_segment_delete

  -- create nil proxy
  visibility: publicSlot
   void nilSegment = proxy_null Xgl_segment* Xgl_segment_seal {xgl segment deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_segment at: unsigned_int = proxy_null Xgl_segment* Xgl_segment_seal {xgl segment deadCopy} call xgl_segment_at
   Xgl_segment at: unsigned_int Put: Xgl_segment = void call xgl_segment_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_segment length = unsigned_long getMember length
   Xgl_segment length: unsigned_long = void setMember length

   Xgl_segment offset = unsigned_long getMember offset
   Xgl_segment offset: unsigned_long = void setMember offset


traits: traits xgl raw splineData
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_spline_data {xgl splineData deadCopy} call xgl_spline_data_new
   Xgl_spline_data delete = void call xgl_spline_data_delete

  -- create nil proxy
  visibility: publicSlot
   void nilSplineData = proxy_null Xgl_spline_data* Xgl_spline_data_seal {xgl splineData deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_spline_data at: unsigned_int = proxy_null Xgl_spline_data* Xgl_spline_data_seal {xgl splineData deadCopy} call xgl_spline_data_at
   Xgl_spline_data at: unsigned_int Put: Xgl_spline_data = void call xgl_spline_data_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_spline_data data = Float_vec_proxy {xgl floatVecProxy deadCopy} call xgl_spline_data_data

   Xgl_spline_data w = float getMember w
   Xgl_spline_data w: float = void setMember w


traits: traits xgl raw surfColorSpline
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_surf_color_spline {xgl surfColorSpline deadCopy} call xgl_surf_color_spline_new
   Xgl_surf_color_spline delete = void call xgl_surf_color_spline_delete

  -- create nil proxy
  visibility: publicSlot
   void nilSurfColorSpline = proxy_null Xgl_surf_color_spline* Xgl_surf_color_spline_seal {xgl surfColorSpline deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_surf_color_spline at: unsigned_int = proxy_null Xgl_surf_color_spline* Xgl_surf_color_spline_seal {xgl surfColorSpline deadCopy} call xgl_surf_color_spline_at
   Xgl_surf_color_spline at: unsigned_int Put: Xgl_surf_color_spline = void call xgl_surf_color_spline_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_surf_color_spline colors = Xgl_color_homogeneous {xgl colorHomogeneous deadCopy} getMember colors
   Xgl_surf_color_spline colors: proxy_null Xgl_color_homogeneous* Xgl_color_homogeneous_seal = void setMember colors

   Xgl_surf_color_spline knot_vector_u = Float_vec_proxy {xgl floatVecProxy deadCopy} getMember knot_vector_u
   Xgl_surf_color_spline knot_vector_u: Float_vec_proxy = void setMember knot_vector_u

   Xgl_surf_color_spline knot_vector_v = Float_vec_proxy {xgl floatVecProxy deadCopy} getMember knot_vector_v
   Xgl_surf_color_spline knot_vector_v: Float_vec_proxy = void setMember knot_vector_v

   Xgl_surf_color_spline num_knots_u = unsigned_long getMember num_knots_u
   Xgl_surf_color_spline num_knots_u: unsigned_long = void setMember num_knots_u

   Xgl_surf_color_spline num_knots_v = unsigned_long getMember num_knots_v
   Xgl_surf_color_spline num_knots_v: unsigned_long = void setMember num_knots_v

   Xgl_surf_color_spline order_u = unsigned_long getMember order_u
   Xgl_surf_color_spline order_u: unsigned_long = void setMember order_u

   Xgl_surf_color_spline order_v = unsigned_long getMember order_v
   Xgl_surf_color_spline order_v: unsigned_long = void setMember order_v

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_surf_color_spline set_Colors: proxy_null Xgl_color_homogeneous* Xgl_color_homogeneous_seal \
	Knot_vector_u: any float* \
	Knot_vector_v: any float* \
	Num_knots_u: unsigned_long \
	Num_knots_v: unsigned_long \
	Order_u: unsigned_long \
	Order_v: unsigned_long \
	 = void call xgl_surf_color_spline_set


traits: traits xgl raw surfDataSpline
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_surf_data_spline {xgl surfDataSpline deadCopy} call xgl_surf_data_spline_new
   Xgl_surf_data_spline delete = void call xgl_surf_data_spline_delete

  -- create nil proxy
  visibility: publicSlot
   void nilSurfDataSpline = proxy_null Xgl_surf_data_spline* Xgl_surf_data_spline_seal {xgl surfDataSpline deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_surf_data_spline at: unsigned_int = proxy_null Xgl_surf_data_spline* Xgl_surf_data_spline_seal {xgl surfDataSpline deadCopy} call xgl_surf_data_spline_at
   Xgl_surf_data_spline at: unsigned_int Put: Xgl_surf_data_spline = void call xgl_surf_data_spline_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_surf_data_spline data = Xgl_spline_data {xgl splineData deadCopy} getMember data
   Xgl_surf_data_spline data: proxy_null Xgl_spline_data* Xgl_spline_data_seal = void setMember data

   Xgl_surf_data_spline knot_vector_u = Float_vec_proxy {xgl floatVecProxy deadCopy} getMember knot_vector_u
   Xgl_surf_data_spline knot_vector_u: Float_vec_proxy = void setMember knot_vector_u

   Xgl_surf_data_spline knot_vector_v = Float_vec_proxy {xgl floatVecProxy deadCopy} getMember knot_vector_v
   Xgl_surf_data_spline knot_vector_v: Float_vec_proxy = void setMember knot_vector_v

   Xgl_surf_data_spline num_knots_u = unsigned_long getMember num_knots_u
   Xgl_surf_data_spline num_knots_u: unsigned_long = void setMember num_knots_u

   Xgl_surf_data_spline num_knots_v = unsigned_long getMember num_knots_v
   Xgl_surf_data_spline num_knots_v: unsigned_long = void setMember num_knots_v

   Xgl_surf_data_spline order_u = unsigned_long getMember order_u
   Xgl_surf_data_spline order_u: unsigned_long = void setMember order_u

   Xgl_surf_data_spline order_v = unsigned_long getMember order_v
   Xgl_surf_data_spline order_v: unsigned_long = void setMember order_v

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_surf_data_spline set_Data: proxy_null Xgl_spline_data* Xgl_spline_data_seal \
	Knot_vector_u: any float* \
	Knot_vector_v: any float* \
	Num_knots_u: unsigned_long \
	Num_knots_v: unsigned_long \
	Order_u: unsigned_long \
	Order_v: unsigned_long \
	 = void call xgl_surf_data_spline_set


traits: traits xgl raw surfDataSplineList
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_surf_data_spline_list {xgl surfDataSplineList deadCopy} call xgl_surf_data_spline_list_new
   Xgl_surf_data_spline_list delete = void call xgl_surf_data_spline_list_delete

  -- create nil proxy
  visibility: publicSlot
   void nilSurfDataSplineList = proxy_null Xgl_surf_data_spline_list* Xgl_surf_data_spline_list_seal {xgl surfDataSplineList deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_surf_data_spline_list at: unsigned_int = proxy_null Xgl_surf_data_spline_list* Xgl_surf_data_spline_list_seal {xgl surfDataSplineList deadCopy} call xgl_surf_data_spline_list_at
   Xgl_surf_data_spline_list at: unsigned_int Put: Xgl_surf_data_spline_list = void call xgl_surf_data_spline_list_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_surf_data_spline_list data_splines = Xgl_surf_data_spline {xgl surfDataSpline deadCopy} getMember data_splines
   Xgl_surf_data_spline_list data_splines: proxy_null Xgl_surf_data_spline* Xgl_surf_data_spline_seal = void setMember data_splines

   Xgl_surf_data_spline_list num_data_splines = unsigned_long getMember num_data_splines
   Xgl_surf_data_spline_list num_data_splines: unsigned_long = void setMember num_data_splines


traits: traits xgl raw textureBlendRgb
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_texture_blend_rgb {xgl textureBlendRgb deadCopy} call xgl_texture_blend_rgb_new
   Xgl_texture_blend_rgb delete = void call xgl_texture_blend_rgb_delete

  -- create nil proxy
  visibility: publicSlot
   void nilTextureBlendRgb = proxy_null Xgl_texture_blend_rgb* Xgl_texture_blend_rgb_seal {xgl textureBlendRgb deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_texture_blend_rgb at: unsigned_int = proxy_null Xgl_texture_blend_rgb* Xgl_texture_blend_rgb_seal {xgl textureBlendRgb deadCopy} call xgl_texture_blend_rgb_at
   Xgl_texture_blend_rgb at: unsigned_int Put: Xgl_texture_blend_rgb = void call xgl_texture_blend_rgb_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_texture_blend_rgb c1 = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_texture_blend_rgb_c1
   Xgl_texture_blend_rgb c1: Xgl_color_rgb = void call xgl_texture_blend_rgb_c1

   Xgl_texture_blend_rgb c2 = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_texture_blend_rgb_c2
   Xgl_texture_blend_rgb c2: Xgl_color_rgb = void call xgl_texture_blend_rgb_c2


traits: traits xgl raw textureColorCompInfo
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_texture_color_comp_info {xgl textureColorCompInfo deadCopy} call xgl_texture_color_comp_info_new
   Xgl_texture_color_comp_info delete = void call xgl_texture_color_comp_info_delete

  -- create nil proxy
  visibility: publicSlot
   void nilTextureColorCompInfo = proxy_null Xgl_texture_color_comp_info* Xgl_texture_color_comp_info_seal {xgl textureColorCompInfo deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_texture_color_comp_info at: unsigned_int = proxy_null Xgl_texture_color_comp_info* Xgl_texture_color_comp_info_seal {xgl textureColorCompInfo deadCopy} call xgl_texture_color_comp_info_at
   Xgl_texture_color_comp_info at: unsigned_int Put: Xgl_texture_color_comp_info = void call xgl_texture_color_comp_info_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_texture_color_comp_info num_render_comp_desc = unsigned_long getMember num_render_comp_desc
   Xgl_texture_color_comp_info num_render_comp_desc: unsigned_long = void setMember num_render_comp_desc

   Xgl_texture_color_comp_info render_component_desc = Xgl_render_component_desc {xgl renderComponentDesc deadCopy} call xgl_texture_color_comp_info_render_component_desc


traits: traits xgl raw textureDecalRgb
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_texture_decal_rgb {xgl textureDecalRgb deadCopy} call xgl_texture_decal_rgb_new
   Xgl_texture_decal_rgb delete = void call xgl_texture_decal_rgb_delete

  -- create nil proxy
  visibility: publicSlot
   void nilTextureDecalRgb = proxy_null Xgl_texture_decal_rgb* Xgl_texture_decal_rgb_seal {xgl textureDecalRgb deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_texture_decal_rgb at: unsigned_int = proxy_null Xgl_texture_decal_rgb* Xgl_texture_decal_rgb_seal {xgl textureDecalRgb deadCopy} call xgl_texture_decal_rgb_at
   Xgl_texture_decal_rgb at: unsigned_int Put: Xgl_texture_decal_rgb = void call xgl_texture_decal_rgb_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_texture_decal_rgb c = Xgl_color_rgb {xgl colorRgb deadCopy} call xgl_texture_decal_rgb_c
   Xgl_texture_decal_rgb c: Xgl_color_rgb = void call xgl_texture_decal_rgb_c


traits: traits xgl raw textureDesc
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_texture_desc {xgl textureDesc deadCopy} call xgl_texture_desc_new
   Xgl_texture_desc delete = void call xgl_texture_desc_delete

  -- create nil proxy
  visibility: publicSlot
   void nilTextureDesc = proxy_null Xgl_texture_desc* Xgl_texture_desc_seal {xgl textureDesc deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_texture_desc at: unsigned_int = proxy_null Xgl_texture_desc* Xgl_texture_desc_seal {xgl textureDesc deadCopy} call xgl_texture_desc_at
   Xgl_texture_desc at: unsigned_int Put: Xgl_texture_desc = void call xgl_texture_desc_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_texture_desc comp_info = Xgl_texture_color_comp_info {xgl textureColorCompInfo deadCopy} call xgl_texture_desc_comp_info
   Xgl_texture_desc comp_info: Xgl_texture_color_comp_info = void call xgl_texture_desc_comp_info

   Xgl_texture_desc info_mipmap = Xgl_texture_mipmap_desc {xgl textureMipmapDesc deadCopy} call xgl_texture_desc_info_mipmap
   Xgl_texture_desc info_mipmap: Xgl_texture_mipmap_desc = void call xgl_texture_desc_info_mipmap

   Xgl_texture_desc interp_info = Xgl_texture_interp_info {xgl textureInterpInfo deadCopy} call xgl_texture_desc_interp_info
   Xgl_texture_desc interp_info: Xgl_texture_interp_info = void call xgl_texture_desc_interp_info

   Xgl_texture_desc texture_type = any Xgl_texture_type getMember texture_type
   Xgl_texture_desc texture_type: any Xgl_texture_type = void setMember texture_type

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_texture_desc set_Comp_info: Xgl_texture_color_comp_info \
	Info_mipmap: Xgl_texture_mipmap_desc \
	Interp_info: Xgl_texture_interp_info \
	Texture_type: any Xgl_texture_type \
	 = void call xgl_texture_desc_set


traits: traits xgl raw textureInterpInfo
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_texture_interp_info {xgl textureInterpInfo deadCopy} call xgl_texture_interp_info_new
   Xgl_texture_interp_info delete = void call xgl_texture_interp_info_delete

  -- create nil proxy
  visibility: publicSlot
   void nilTextureInterpInfo = proxy_null Xgl_texture_interp_info* Xgl_texture_interp_info_seal {xgl textureInterpInfo deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_texture_interp_info at: unsigned_int = proxy_null Xgl_texture_interp_info* Xgl_texture_interp_info_seal {xgl textureInterpInfo deadCopy} call xgl_texture_interp_info_at
   Xgl_texture_interp_info at: unsigned_int Put: Xgl_texture_interp_info = void call xgl_texture_interp_info_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_texture_interp_info filter1 = any Xgl_texture_interp_method getMember filter1
   Xgl_texture_interp_info filter1: any Xgl_texture_interp_method = void setMember filter1

   Xgl_texture_interp_info filter2 = any Xgl_texture_interp_method getMember filter2
   Xgl_texture_interp_info filter2: any Xgl_texture_interp_method = void setMember filter2

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_texture_interp_info set_Filter1: any Xgl_texture_interp_method \
	Filter2: any Xgl_texture_interp_method \
	 = void call xgl_texture_interp_info_set


traits: traits xgl raw textureMipmapDesc
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_texture_mipmap_desc {xgl textureMipmapDesc deadCopy} call xgl_texture_mipmap_desc_new
   Xgl_texture_mipmap_desc delete = void call xgl_texture_mipmap_desc_delete

  -- create nil proxy
  visibility: publicSlot
   void nilTextureMipmapDesc = proxy_null Xgl_texture_mipmap_desc* Xgl_texture_mipmap_desc_seal {xgl textureMipmapDesc deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_texture_mipmap_desc at: unsigned_int = proxy_null Xgl_texture_mipmap_desc* Xgl_texture_mipmap_desc_seal {xgl textureMipmapDesc deadCopy} call xgl_texture_mipmap_desc_at
   Xgl_texture_mipmap_desc at: unsigned_int Put: Xgl_texture_mipmap_desc = void call xgl_texture_mipmap_desc_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_texture_mipmap_desc boundary_values = Unsigned_char_vec_proxy {xgl unsignedCharVecProxy deadCopy} call xgl_texture_mipmap_desc_boundary_values

   Xgl_texture_mipmap_desc depth_interp_factor = float getMember depth_interp_factor
   Xgl_texture_mipmap_desc depth_interp_factor: float = void setMember depth_interp_factor

   Xgl_texture_mipmap_desc max_u_freq = float getMember max_u_freq
   Xgl_texture_mipmap_desc max_u_freq: float = void setMember max_u_freq

   Xgl_texture_mipmap_desc max_v_freq = float getMember max_v_freq
   Xgl_texture_mipmap_desc max_v_freq: float = void setMember max_v_freq

   Xgl_texture_mipmap_desc texture_map = Xgl_object_obj {xgl genericObject deadCopy} getMember texture_map
   Xgl_texture_mipmap_desc texture_map: Xgl_object_obj = void setMember texture_map

   Xgl_texture_mipmap_desc u_boundary = any Xgl_texture_boundary getMember u_boundary
   Xgl_texture_mipmap_desc u_boundary: any Xgl_texture_boundary = void setMember u_boundary

   Xgl_texture_mipmap_desc v_boundary = any Xgl_texture_boundary getMember v_boundary
   Xgl_texture_mipmap_desc v_boundary: any Xgl_texture_boundary = void setMember v_boundary

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_texture_mipmap_desc set_Depth_interp_factor: float \
	Max_u_freq: float \
	Max_v_freq: float \
	Texture_map: Xgl_object_obj \
	U_boundary: any Xgl_texture_boundary \
	V_boundary: any Xgl_texture_boundary \
	 = void call xgl_texture_mipmap_desc_set


traits: traits xgl raw threshold
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_threshold {xgl threshold deadCopy} call xgl_threshold_new
   Xgl_threshold delete = void call xgl_threshold_delete

  -- create nil proxy
  visibility: publicSlot
   void nilThreshold = proxy_null Xgl_threshold* Xgl_threshold_seal {xgl threshold deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_threshold at: unsigned_int = proxy_null Xgl_threshold* Xgl_threshold_seal {xgl threshold deadCopy} call xgl_threshold_at
   Xgl_threshold at: unsigned_int Put: Xgl_threshold = void call xgl_threshold_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_threshold circles = unsigned_long getMember circles
   Xgl_threshold circles: unsigned_long = void setMember circles

   Xgl_threshold polygons = unsigned_long getMember polygons
   Xgl_threshold polygons: unsigned_long = void setMember polygons

   Xgl_threshold vectors = unsigned_long getMember vectors
   Xgl_threshold vectors: unsigned_long = void setMember vectors

  -- efficiency message: set a bunch of fields at once
  visibility: publicSlot
   Xgl_threshold set_Circles: unsigned_long \
	Polygons: unsigned_long \
	Vectors: unsigned_long \
	 = void call xgl_threshold_set


traits: traits xgl raw trimCurve
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_trim_curve {xgl trimCurve deadCopy} call xgl_trim_curve_new
   Xgl_trim_curve delete = void call xgl_trim_curve_delete

  -- create nil proxy
  visibility: publicSlot
   void nilTrimCurve = proxy_null Xgl_trim_curve* Xgl_trim_curve_seal {xgl trimCurve deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_trim_curve at: unsigned_int = proxy_null Xgl_trim_curve* Xgl_trim_curve_seal {xgl trimCurve deadCopy} call xgl_trim_curve_at
   Xgl_trim_curve at: unsigned_int Put: Xgl_trim_curve = void call xgl_trim_curve_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_trim_curve ctrl_pts = Xgl_pt_list {xgl ptList deadCopy} call xgl_trim_curve_ctrl_pts
   Xgl_trim_curve ctrl_pts: Xgl_pt_list = void call xgl_trim_curve_ctrl_pts

   Xgl_trim_curve knot_vector = Float_vec_proxy {xgl floatVecProxy deadCopy} getMember knot_vector
   Xgl_trim_curve knot_vector: Float_vec_proxy = void setMember knot_vector

   Xgl_trim_curve num_knots = unsigned_long getMember num_knots
   Xgl_trim_curve num_knots: unsigned_long = void setMember num_knots

   Xgl_trim_curve order = unsigned_long getMember order
   Xgl_trim_curve order: unsigned_long = void setMember order

   Xgl_trim_curve range = Xgl_bounds_f1d {xgl boundsF1d deadCopy} call xgl_trim_curve_range
   Xgl_trim_curve range: Xgl_bounds_f1d = void call xgl_trim_curve_range

   Xgl_trim_curve trim_curve_approx = any Xgl_trim_curve_approx getMember trim_curve_approx
   Xgl_trim_curve trim_curve_approx: any Xgl_trim_curve_approx = void setMember trim_curve_approx

   Xgl_trim_curve trim_curve_approx_value = float getMember trim_curve_approx_value
   Xgl_trim_curve trim_curve_approx_value: float = void setMember trim_curve_approx_value

   Xgl_trim_curve trim_curve_vis = bool getMember trim_curve_vis
   Xgl_trim_curve trim_curve_vis: bool = void setMember trim_curve_vis


traits: traits xgl raw trimLoop
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_trim_loop {xgl trimLoop deadCopy} call xgl_trim_loop_new
   Xgl_trim_loop delete = void call xgl_trim_loop_delete

  -- create nil proxy
  visibility: publicSlot
   void nilTrimLoop = proxy_null Xgl_trim_loop* Xgl_trim_loop_seal {xgl trimLoop deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_trim_loop at: unsigned_int = proxy_null Xgl_trim_loop* Xgl_trim_loop_seal {xgl trimLoop deadCopy} call xgl_trim_loop_at
   Xgl_trim_loop at: unsigned_int Put: Xgl_trim_loop = void call xgl_trim_loop_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_trim_loop curves = Xgl_trim_curve {xgl trimCurve deadCopy} getMember curves
   Xgl_trim_loop curves: proxy_null Xgl_trim_curve* Xgl_trim_curve_seal = void setMember curves

   Xgl_trim_loop num_curves = unsigned_long getMember num_curves
   Xgl_trim_loop num_curves: unsigned_long = void setMember num_curves


traits: traits xgl raw trimLoopList
  -- creation and deletion messages
  visibility: publicSlot
   void new: unsigned_int = Xgl_trim_loop_list {xgl trimLoopList deadCopy} call xgl_trim_loop_list_new
   Xgl_trim_loop_list delete = void call xgl_trim_loop_list_delete

  -- create nil proxy
  visibility: publicSlot
   void nilTrimLoopList = proxy_null Xgl_trim_loop_list* Xgl_trim_loop_list_seal {xgl trimLoopList deadCopy} get 0

  -- vector-ish messages
  visibility: publicSlot
   Xgl_trim_loop_list at: unsigned_int = proxy_null Xgl_trim_loop_list* Xgl_trim_loop_list_seal {xgl trimLoopList deadCopy} call xgl_trim_loop_list_at
   Xgl_trim_loop_list at: unsigned_int Put: Xgl_trim_loop_list = void call xgl_trim_loop_list_at_put

  -- accessor messages
  visibility: publicSlot
   Xgl_trim_loop_list num_loops = unsigned_long getMember num_loops
   Xgl_trim_loop_list num_loops: unsigned_long = void setMember num_loops

   Xgl_trim_loop_list trim_loops = Xgl_trim_loop {xgl trimLoop deadCopy} getMember trim_loops
   Xgl_trim_loop_list trim_loops: proxy_null Xgl_trim_loop* Xgl_trim_loop_seal = void setMember trim_loops


traits: traits xgl raw intVecProxy
  -- creation/deletion messages
  visibility: publicSlot
   void new: unsigned_int = Int_vec_proxy {xgl intVecProxy deadCopy} call int_vec_proxy_new
   Int_vec_proxy delete = void call int_vec_proxy_delete

  -- vector-ish messages
  visibility: publicSlot
   Int_vec_proxy at: unsigned_int = int call int_vec_proxy_at
   Int_vec_proxy at: unsigned_int Put: int = void call int_vec_proxy_at_put
 
 
traits: traits xgl raw longVecProxy
  -- creation/deletion messages
  visibility: publicSlot
   void new: unsigned_int = Long_vec_proxy {xgl longVecProxy deadCopy} call long_vec_proxy_new
   Long_vec_proxy delete = void call long_vec_proxy_delete

  -- vector-ish messages
  visibility: publicSlot
   Long_vec_proxy at: unsigned_int = long call long_vec_proxy_at
   Long_vec_proxy at: unsigned_int Put: long = void call long_vec_proxy_at_put
 
 
traits: traits xgl raw floatVecProxy
  -- creation/deletion messages
  visibility: publicSlot
   void new: unsigned_int = Float_vec_proxy {xgl floatVecProxy deadCopy} call float_vec_proxy_new
   Float_vec_proxy delete = void call float_vec_proxy_delete

  -- vector-ish messages
  visibility: publicSlot
   Float_vec_proxy at: unsigned_int = float call float_vec_proxy_at
   Float_vec_proxy at: unsigned_int Put: float = void call float_vec_proxy_at_put
 
 
traits: traits xgl raw doubleVecProxy
  -- creation/deletion messages
  visibility: publicSlot
   void new: unsigned_int = Double_vec_proxy {xgl doubleVecProxy deadCopy} call double_vec_proxy_new
   Double_vec_proxy delete = void call double_vec_proxy_delete

  -- vector-ish messages
  visibility: publicSlot
   Double_vec_proxy at: unsigned_int = double call double_vec_proxy_at
   Double_vec_proxy at: unsigned_int Put: double = void call double_vec_proxy_at_put
 
 
traits: traits xgl raw unsignedCharVecProxy
  -- creation/deletion messages
  visibility: publicSlot
   void new: unsigned_int = Unsigned_char_vec_proxy {xgl unsignedCharVecProxy deadCopy} call unsigned_char_vec_proxy_new
   Unsigned_char_vec_proxy delete = void call unsigned_char_vec_proxy_delete

  -- vector-ish messages
  visibility: publicSlot
   Unsigned_char_vec_proxy at: unsigned_int = unsigned_char call unsigned_char_vec_proxy_at
   Unsigned_char_vec_proxy at: unsigned_int Put: unsigned_char = void call unsigned_char_vec_proxy_at_put
 
'
