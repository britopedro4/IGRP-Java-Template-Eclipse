(function(){

	var com;

	var lang = document.cookie.split(';');
	
	var exportOptions = {

			pdf : {
	           extend          : 'pdfHtml5',
	           text            : '<i class="fa fa-file-pdf-o"></i> PDF',
	           titleAttr       : 'Exportar para PDF',
	           className 	   : 'btn btn-danger btn-xs',
	           exportOptions   : {
	               columns     : ':not(.igrp-table-ctx-th)'
	           },
	           customize: function (doc) {
	        	   var tcontent = doc.content[1] || doc.content[0];
	        	   
	        	   if(tcontent && tcontent.table)
	        		   tcontent.table.widths = Array(tcontent.table.body[0].length + 1).join('*').split('');
	           }
	       },

	       excel : {
	           extend          : 'excelHtml5',
	           text            : '<i class="fa fa-file-excel-o"></i> Excel',
	           titleAttr       : 'Exportar para Excel',
	           className 	   : 'btn btn-success btn-xs',
	           exportOptions   : {
	               columns     : ':not(.igrp-table-ctx-th)'
	           }
	       }

		};
	
	$.IGRP.component('tableCtrl',{
		ordertable : function(selector){

			selector = selector || '.ordertable';

			if ($(selector)[0] && $.fn.sortable) {

				var form = $.IGRP.utils.getForm();

				$(selector+' tbody').sortable({
					containment 	: "parent",
					scroll :false,
					forceHelperSize : true,
					distance 		: 5,
		            stop  			: function(e){

		            	var id 	 = $(e.target).parents('table').attr('id'),

		            		name = 'p_fwl_'+id+'_order';

		              	$('input[name="'+name+'"]').remove();

		              	$('tr',$(e.target)).each(function(){
		              		
		              		var obj = $('input[name="p_'+id+'_id"]',$(this));

		              		obj = obj[0] ? obj : $('input[name="p_'+id+'_id_fk"]',$(this));

		              		if (obj.val()) 
		              			form.append('<input type="hidden" class="submittable" name="'+name+'" value="'+obj.val()+'"/>');
		              	});
		            }
	           });
			}
		},

		dataTable : function(op){

			var o = $.extend({

				selector 		: '.igrp-data-table',
				language 		: getCookie("igrp_lang"),
				parent          : 'body'

			}, op);

			var tables = $(o.selector,o.parent);

			if(tables[0] && $.fn.DataTable){
				
				var PageInfo = $.IGRP.info;

				tables.each(function(i,t){
					
					var headerContents = $(t).parents('.box-table-contents').first().find('.table-contents-head'),

						tableTitle 	   = $(t).parents('.box').first().find('.box-title').text() || $('#gen-page-title').text(),

						exprts 		   = $(t).attr('exports'),
						
						getInfo        = function(instance){
							
							return 'IGRP-datatable-'+instance+'-'+PageInfo.app+'-'+PageInfo.page;
						
						},

						options 	   = {

							dom: 'lfrtip',

							language: {

					            url: path+'/core/igrp/table/datatable/language/'+o.language+'.json'	

					        },
					        stateSave   : true,
					        
					        stateSaveCallback: function(settings,data) {
					        	
					            localStorage.setItem( getInfo( settings.sInstance ) , JSON.stringify(data) )
					            
					        },
					        stateLoadCallback: function(settings) {
					        	
					          return JSON.parse( localStorage.getItem( getInfo( settings.sInstance ) ) )
					          
					        },

					        order  		: [],

							columnDefs	: [{

						      	targets   : 'no-sort',

						      	orderable : false

						    }],
						    lengthMenu: [[20, 50, -1], [20, 50, "All"]],
					        initComplete:function(){}

						};

					if(exprts){

						var expArr = exprts.split(',');

						options.buttons = [];

						expArr.forEach(function(e){

							var eOpts = exportOptions[e];

							if(eOpts){
								
								eOpts.title = tableTitle;

								options.buttons.push( eOpts );

							}
							
						});

						options.dom = 'lfBrtip';

					};

					var datatable = $(t).DataTable(options)

					$.IGRP.on('submit',function(o){
						
						if(o.valid)

							datatable.destroy();

	            	});
					
				});

			}

		},
		
		setTableStyle : function(wrapper){
			
			wrapper = wrapper || $('.box-table-contents');
			
			wrapper.each(function(i,t){
				
				var legend = $(t).find('.box-table-legend');
				
				if(legend[0]){
					
					var itemName = $(t).attr('item-name'),
						
						style= '<style id="'+itemName+'">';
						
					legend.find('.legend-holder').each(function(i,l){
						
						var color = $(l).attr('legend-color'),
						
							value = $(l).attr('value');
						
						style+='[item-name="'+itemName+'"] table td.tdcolor span.tdcolor-item[value="'+value+'"] { background-color: '+color+' }'
						
					});
					
					style+='</style>';
					
					if(!$('html>head #'+itemName)[0])
						
						$('html>head').append(style);
					else
						$('html>head #'+itemName).html(style);
						
				
				}

			});
			
		},
		
		checkdControl : function(p){
			
			var inp   = $('input[type="hidden"].'+p.rel, p.o),
			
				check   = p.o.find( '.'+p.rel+'_check' );
			
			if(p.check){
				
				check.val( p.value );
				
                if (inp[0])
                    inp.remove();
                
                
            }else{
            
            	check.val( "" );
            	
                if (!inp[0])
                    p.o.append('<input type="hidden" class="'+p.rel+'" value="'+p.value+'" name="'+p.name+'"/>');
                
                
            }
			
			
		},
		
		contextTHWidth : function(){

			$('th.igrp-table-ctx-th').each(function(i,th){

				var table   = $(th).parents('table').first(),

					tds     = table.find('tbody>tr').first().find('td.igrp-table-ctx-td'),

					buttons = tds.find('.table-ctx-holder>li'),

					mr 		= 4;//margin-right

				if(buttons.length>=3)

					$(th).css('width',128 );//.css('min-width',128)

				else

					$(th).width( (buttons.width()+mr) * buttons.length + 2)

			});

		},

		setEvents : function(){

			//CheckAll
			$(document).on('change', 'table .IGRP_checkall', function() {
				var table    = $(this).parents('.table').first(),
					checkrel = $(this).attr('check-rel'),
					checkers = $('[check-rel="'+checkrel+'"]:not(.IGRP_checkall)',table),
					checkAll = $(this).is(':checked');
					
				
				checkers.each(function(i,e){
					var parent 	 = $(e).parents('div[item-name="'+checkrel+'"]')[0] ? $(e).parents('div[item-name="'+checkrel+'"]') : $(e).parents('td');
					com.checkdControl({
						rel 	: checkrel,
						o   	: parent,
						check 	: checkAll,
						value   : $(e).val(),
						name    : $(e).attr('name')
					});
				});

				checkers.prop('checked',checkAll).attr('checked',checkAll);
			});

			$(document).on('change','table [item-type="checkbox"] input[type="checkbox"][name], table .checkdcontrol',function(e){
				
                var o   = $(this),
                    rel = o.attr('check-rel'),
                    obj = $('td[item-name="'+rel+'"]',o.parents('tr:first')),
                    inp = $('input[type="hidden"].'+rel,obj);

                com.checkdControl({
                    rel     : rel,
                    o       : obj,
                    check   : o.is(':checked'),
                    value   : o.val(),
                    name    : o.attr('name')
                });
            });
			
			$.IGRP.on('windowResize',function(){

            	com.contextTHWidth();

            });

		},

		init:function(){
			
			com = this;

			com.dataTable();
			
			com.setEvents();

			com.ordertable();

			com.setTableStyle();
			
			com.contextTHWidth();
			
		}

	},true);

	function getCookie(cname) {
	    var name = cname + "=";
	    var decodedCookie = decodeURIComponent(document.cookie);
	    var ca = decodedCookie.split(';');
	    for(var i = 0; i <ca.length; i++) {
	        var c = ca[i];
	        while (c.charAt(0) == ' ') {
	            c = c.substring(1);
	        }
	        if (c.indexOf(name) == 0) {
	            return c.substring(name.length, c.length);
	        }
	    }	    
	    return "en_US";
	}
})();



