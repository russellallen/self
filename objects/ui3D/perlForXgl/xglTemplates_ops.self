'Sun-$Revision: 20.1 $'
 
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


traits: traits windowing xgl raw systemState
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


traits: traits windowing xgl raw genericObject
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

'
