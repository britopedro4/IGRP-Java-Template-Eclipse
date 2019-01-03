<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"><xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/><xsl:template match="/"><html><head><xsl:call-template name="IGRP-head"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/datatable/dataTables.bootstrap.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/><link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/><style/></head><body class="{$bodyClass} sidebar-off"><xsl:call-template name="IGRP-topmenu"/><form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data"><div class="container-fluid"><div class="row"><xsl:call-template name="IGRP-sidebar"/><div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents"><div class="content"><div class="row " id="row-9613514b"><div class="gen-column col-sm-12"><div class="gen-inner"><xsl:if test="rows/content/sectionheader_1"><section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1"><h2><xsl:value-of disable-output-escaping="yes" select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/></h2></section></xsl:if><xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/><xsl:if test="rows/content/form_1"><div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1"><div class="box-body"><div role="form"><xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/><xsl:if test="rows/content/form_1/fields/aplicacao"><div class="col-sm-3 form-group  gen-fields-holder" item-name="aplicacao" item-type="select"><label for="{rows/content/form_1/fields/aplicacao/@name}"><xsl:value-of select="rows/content/form_1/fields/aplicacao/label"/></label><select class="form-control select2 IGRP_change" id="form_1_aplicacao" name="{rows/content/form_1/fields/aplicacao/@name}"><xsl:call-template name="setAttributes"><xsl:with-param name="field" select="rows/content/form_1/fields/aplicacao"/></xsl:call-template><xsl:for-each select="rows/content/form_1/fields/aplicacao/list/option"><option value="{value}" label="{text}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><span><xsl:value-of select="text"/></span></option></xsl:for-each></select></div></xsl:if><xsl:if test="rows/content/form_1/fields/adicionar_organica"><div class="form-group col-sm-3 pull-right gen-fields-holder" item-name="adicionar_organica" item-type="link"><a href="{rows/content/form_1/fields/adicionar_organica/value}" class="link btn btn-primary form-link" close="refresh" target="right_panel" request-fields=""><i class="fa fa-plus-square"/><span><span><xsl:value-of select="rows/content/form_1/fields/adicionar_organica/label"/></span></span></a></div></xsl:if><xsl:if test="rows/content/form_1/fields/gestao_de_utilizadores"><div class="form-group col-sm-3 pull-right gen-fields-holder" item-name="gestao_de_utilizadores" item-type="link"><a href="{rows/content/form_1/fields/gestao_de_utilizadores/value}" class="link btn btn-success form-link" target="modal" request-fields=""><i class="fa fa-users"/><span><span><xsl:value-of select="rows/content/form_1/fields/gestao_de_utilizadores/label"/></span></span></a></div></xsl:if><xsl:if test="rows/content/form_1/fields/gestao_de_menu"><div class="form-group col-sm-3 pull-right gen-fields-holder" item-name="gestao_de_menu" item-type="link"><a href="{rows/content/form_1/fields/gestao_de_menu/value}" class="link btn btn-info form-link" close="refresh" target="modal" request-fields=""><i class="fa fa-bars"/><span><span><xsl:value-of select="rows/content/form_1/fields/gestao_de_menu/label"/></span></span></a></div></xsl:if></div></div><xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/></div></xsl:if></div></div></div><div class="row " id="row-1f658256"><div class="gen-column col-sm-12"><div class="gen-inner"><xsl:if test="rows/content/org_table"><div class="box box-table-contents gen-container-item acess" gen-class="acess" item-name="org_table"><xsl:call-template name="box-header"><xsl:with-param name="title" select="rows/content/org_table/@title"/><xsl:with-param name="collapsible" select="'false'"/><xsl:with-param name="collapsed" select="'false'"/></xsl:call-template><div class="box-body "><div class="table-contents-head"><div class="table-contents-inner"></div></div><div class="table-box"><div class="table-box-inner"><table id="org_table" class="table table-striped  igrp-data-table IGRP_contextmenu " exports=""><thead><tr><xsl:if test="rows/content/org_table/fields/estado"><th class="bs-checkbox gen-fields-holder pagelist-status" align="center"><label class="container-box checkbox-switch switch"><span><xsl:value-of select="rows/content/org_table/fields/estado/label"/></span><input type="checkbox" class="IGRP_checkall" check-rel="estado" data-title="Estado" data-toggle="tooltip"/><span class="checkmark"/></label></th></xsl:if><xsl:if test="rows/content/org_table/fields/org_nome"><th align="center" class=" gen-fields-holder"><span><xsl:value-of select="rows/content/org_table/fields/org_nome/label"/></span></th></xsl:if><xsl:if test="rows/content/org_table/fields/mostrar_perfis"><th align="left" class=" gen-fields-holder center" style="width:110px"/></xsl:if><xsl:if test="rows/content/org_table/table/context-menu/item"><th class="igrp-table-ctx-th"/></xsl:if></tr></thead><tbody><xsl:for-each select="rows/content/org_table/table/value/row[not(@total='yes')]"><tr><xsl:apply-templates mode="context-param" select="context-menu"/><input type="hidden" name="p_id_fk" value="{id}"/><input type="hidden" name="p_id_fk_desc" value="{id_desc}"/><xsl:if test="estado"><td align="center" data-row="{position()}" data-title="{../../label/estado}" class="bs-checkbox pagelist-status" item-name="estado" data-order="{estado_check=estado}"><xsl:if test="estado != '-0'"><label class="container-box checkbox-switch switch"><input type="checkbox" name="p_estado" value="{estado}" check-rel="estado"><xsl:if test="estado_check=estado"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><span class="slider round"/><span class="checkmark"/></label></xsl:if></td></xsl:if><xsl:if test="org_nome"><td align="center" data-order="{org_nome}" data-row="{position()}" data-title="{../../../fields/org_nome/label}" class="text" item-name="org_nome"><span class=""><xsl:value-of select="org_nome"/></span></td></xsl:if><xsl:if test="mostrar_perfis"><td align="left" data-row="{position()}" data-title="{../../label/mostrar_perfis}" class="link center" item-name="mostrar_perfis" style="width:110px"><xsl:choose><xsl:when test="mostrar_perfis != ''"><a href="{normalize-space(mostrar_perfis)}" class="link bClick btn btn-primary btn-xs" target-fields="" target="mpsubmit" request-fields="" name="mostrar_perfis"><i class="fa fa-address-card"/><span><xsl:value-of select="mostrar_perfis_desc"/></span></a></xsl:when><xsl:otherwise><span><xsl:value-of select="mostrar_perfis_desc"/></span></xsl:otherwise></xsl:choose></td></xsl:if><xsl:if test="//rows/content/org_table/table/context-menu/item"><td class="igrp-table-ctx-td"><xsl:apply-templates select="../../context-menu" mode="table-context-inline"><xsl:with-param name="row-params" select="context-menu"/></xsl:apply-templates></td></xsl:if></tr></xsl:for-each></tbody></table></div></div></div></div></xsl:if></div></div></div></div></div></div></div><xsl:call-template name="IGRP-bottom"/></form><script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js?v={$version}"/><script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js?v={$version}"/><script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/><script src="{$path}/core/igrp/IGRP.rules.class.js"/><script>
$.IGRP.rules.set({"p_aplicacao":[{"name":"show table","events":"load,change","isTable":false,"conditions":{"rules":[{"condition":"less","value":"1","value2":"","patern":"","patern_custom":"","opposite":"1"}],"actions":[{"action":"hide","targets":"org_table","procedure":"","request_fields":"","msg_type":"info","msg":""}]}}]},'actionsList');</script><script>$('.acess').on('change','td input[name="p_estado"]',function(){        var isChecked = $(this).is(':checked'),            id         = $(this).parents('tr').find('input[name="p_id_fk"]').val(),            val        = isChecked ? 1 : 0;        $.IGRP.request('webapps?r=igrp_studio/ListaPage/changeStatus',{            params : {                p_id : id,                p_estado : val            },            success:function(r){                var type = r.status ? 'success' : 'danger',                    msg  = r.status ? 'Estado alterado' : 'Estado não foi alterado';                if(r.status)                    $.IGRP.notify({                        message : msg,                        type    : type                    });            },            fail:function(){            }        });    });</script></body></html></xsl:template><xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=30"/><xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=30"/><xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=30"/><xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=30"/><xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=30"/><xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=30"/></xsl:stylesheet>
