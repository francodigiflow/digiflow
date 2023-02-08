<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:pe="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
                xmlns:pe1="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:pe2="urn:oasis:names:specification:ubl:schema:xsd:DebitNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
                xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
                xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">

				<xsl:output method="html" indent="yes" encoding="ISO-8859-1" omit-xml-declaration="yes" />

	<xsl:template name="Datos_FacturaGuia">
		<tr>

			<td>

				<font face="Arial, Helvetica, sans-serif" size="1">
					<strong>Registra tus datos en: <a href="https://registro.multitop.pe/">https://registro.multitop.pe/</a> para recibir nuestras ofertas y novedades</strong>
					<h6>CLÁUSULAS GENERALES DE CONTRATACIÓN</h6>
					<h6>TÉRMINOS Y CONDICIONES GENERALES DE VENTA</h6>
					<p>De conformidad con lo dispuesto por el artículo 1392° del Código Civil peruano, la contratación de servicios o adquisición de bienes, sean prestados, producidos o comercializados (en lo sucesivo, el Contrato) por
				MULTITOP S.A.C. (en lo sucesivo, MULTITOP) se regirá por las siguientes cláusulas generales de contratación</p>
					<h6>I. CAMBIOS O DEVOLUCIONES</h6>
					<p>A efectos de realizar cambios o devoluciones se deberá proceder y cumplir con lo siguiente:</p>
					<p><strong>Requisitos:</strong>
						<ul>
							<li>Presentar comprobante de pago físico o digital.</li>
							<li>Presentar documento de identidad (DNI, carné de extranjería o pasaporte).</li>
							<li>Presentar ticket de ingreso de mercadería (entregado en la puerta de ingreso).</li>
							<li>Los Productos no deben tener menos de cinco (05) metros, tener su empaque original y no evidenciar uso o manipulación que afecte su condición de nuevo</li>
						</ul>
					</p>
					<p><strong>Plazos:</strong>
					El Cliente tiene hasta treinta (30) días calendarios para solicitar el cambio y/o devolución, teniendo en cuenta que se contará a partir de la fecha de compra cuando es presencial o a partir de la fecha de entrega a domicilio
cuando es con servicio de delivery o ventas online. Para el caso de entregas a provincia, desde que el producto es dejado en la agencia de transporte; en este último caso, el Cliente puede coordinar la fecha llamando al
(01) 619 – 4444.

					</p>
					<p><strong>Excepciones:</strong>
					Los productos que no se pueden devolver serán los siguientes:
						<ul>
							<li>Adquiridos bajo la condición de promoción y liquidación.</li>
							<li>Pedidos especiales (productos nuevos a solicitud del Cliente) o de volumen.</li>
							<li>Productos de cuidado y protección personal.</li>
							<li>Saldos y segunda selección.</li>
							<li>Cortes parciales del tipo plásticos transparentes y mangas.</li>
							<li>Papel para encuadernación.</li>
							<li>Espuma blanca milimetrada.</li>
							<li>Colchones, edredones, sets de cama y sábanas (sólo previa validación por el personal responsable).</li>
						</ul>
					</p>
					<p><strong>Consideraciones adicionales:</strong>
						<ul>
							<li>Todo producto que evidencie falla de fabricación será aceptado para cambio o devolución previa validación por el área responsable.</li>
							<li>Para el caso de los pedidos de los diferentes canales de venta que involucren recojo en MULTITOP, los productos se mantendrán almacenados en un plazo máximo de quince (15) días calendarios sin incurrir en
costo alguno, contados desde la fecha de facturación. Vencido este plazo se generará un recargo por concepto de almacenamiento. De no ser recogidos oportunamente en un periodo de treinta (30) días
calendarios, MULTITOP anulará el pedido, emitirá una Nota de Crédito por el monto cancelado, y una Nota de Débito por concepto de almacenamiento.</li>
							<li>Para el caso de los pedidos con Servicio de Confección, los productos se mantendrán almacenados en un plazo máximo de quince (15) días calendarios sin incurrir en costo alguno, contados desde la fecha de
entrega acordada. Vencido este plazo se generará un recargo por concepto de almacenamiento. De no ser recogidos oportunamente en un periodo de treinta (30) días calendarios, MUTITOP anulará el pedido,
emitirá una Nota de Crédito por el monto cancelado, y una Nota de Débito por concepto de almacenamiento.</li>
							<li>En caso el Cliente necesite el recojo de productos a domicilio para solicitar cambios y/o devoluciones, deberá notificar a MULTITOP en un plazo no mayor a seis (06) días hábiles de recibida la mercadería. Dicho
recojo no garantiza la aceptación de la solicitud. De ser aprobada la solicitud de cambios y/o devoluciones, MULTITOP brindará todas las facilidades necesarias para que el despacho del nuevo producto se
realice en un plazo no mayor a tres (03) días hábiles previa revisión.</li>
						</ul>
					</p>
					<h6>II. REEMBOLSO</h6>
					<p>
						<ul>
							<li>Todo producto que evidencie falla de fabricación será aceptado para cambio o devolución previa validación por el área responsable.</li>
							<li>Para el caso de los pedidos de los diferentes canales de venta que involucren recojo en MULTITOP, los productos se mantendrán almacenados en un plazo máximo de quince (15) días calendarios sin incurrir en
costo alguno, contados desde la fecha de facturación. Vencido este plazo se generará un recargo por concepto de almacenamiento. De no ser recogidos oportunamente en un periodo de treinta (30) días
calendarios, MULTITOP anulará el pedido, emitirá una Nota de Crédito por el monto cancelado, y una Nota de Débito por concepto de almacenamiento.</li>
							<li>Para el caso de los pedidos con Servicio de Confección, los productos se mantendrán almacenados en un plazo máximo de quince (15) días calendarios sin incurrir en costo alguno, contados desde la fecha de
entrega acordada. Vencido este plazo se generará un recargo por concepto de almacenamiento. De no ser recogidos oportunamente en un periodo de treinta (30) días calendarios, MUTITOP anulará el pedido,
emitirá una Nota de Crédito por el monto cancelado, y una Nota de Débito por concepto de almacenamiento.</li>
							<li>En caso el Cliente necesite el recojo de productos a domicilio para solicitar cambios y/o devoluciones, deberá notificar a MULTITOP en un plazo no mayor a seis (06) días hábiles de recibida la mercadería. Dicho
recojo no garantiza la aceptación de la solicitud. De ser aprobada la solicitud de cambios y/o devoluciones, MULTITOP brindará todas las facilidades necesarias para que el despacho del nuevo producto se
realice en un plazo no mayor a tres (03) días hábiles previa revisión.</li>
						</ul>
					</p>
					<h6>III. COMPROBANTE DE COMPRA</h6>
					<p>La empresa, no asume responsabilidad por el tipo de comprobante solicitado por el cliente en las acciones de control realizadas por SUNAT.
					Por disposición de SUNAT en su informe N° 033-2002-SUNAT/K00000</p>
					<ul>
						<li>La emisión de la Nota de Crédito procede al anular una operación, ésta debe contener los mismos requisitos y características del comprobante de pago inicial y debe ser emitido al mismo adquiriente o usuario</li>
						<li>No existe ningún procedimiento vigente que permita el canje de boletas de venta por facturas una vez emitidos. Por lo cual el cliente deberá decidir correctamente el documento que solicitará como comprobante
						al momento de su compra, ya que según los párrafos citados no procederá cambio alguno.</li>
					</ul>
					<p>Para más información le agradecemos revisar nuestra página web: <a href="www.multitop.pe">www.multitop.pe</a></p>
				</font>
			</td>
		</tr>
		
	</xsl:template>

	<xsl:template name="bottom_hash">
		<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td align="left">
						<table border="0" bordercolor="#000000" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td valign="top" align="left" width="15%">
									<font face="Arial" size="2">
										<!--<img width="100" height="100">
											<xsl:attribute name="src">
												<xsl:call-template name="timbre"/>
											</xsl:attribute>
										</img>-->
										<img width="100" height="100" align="center" src="data:image/*;base64,[ted_1]"/>
									</font>
								</td>
								<td width="35%" valign="top">
									<font face="Arial, Helvetica, sans-serif" size="1">								
										REPRESENTACIÓN IMPRESA DE LA&#xA0;<xsl:call-template name="aviso"/>
										<br/>PODRA SER CONSULTADO EN: <a href="http://ecomprobantes.multitop.pe">http://ecomprobantes.multitop.pe</a>

							</font>
								</td>
								<td valign="top" width="15%">
									<img width="100" height="100" align="center" src="data:image/*;base64,[logo_2]" />
								</td>
								<td width="35%">
									<font face="Arial, Helvetica, sans-serif" size="1">								
										SUS DATOS PERSONALES Y DE SUS CONTACTOS SON
										<br/>ALMACENADOS PARA LAS OPERACIONES QUE EL PRODUCTO O
										<br/>SERVICIO ADQUIRIDO AMERITEN.
										<br/><br/>
										LEY N° 29733, LEY DE PROTECCIÓN DE DATOS PERSONALES. PUEDE HACER
										<br/>USO DE SUS DERECHOS ARCO A TRAVÉS DE derechoarcoclientes@multitop.pe
										<br/>PARA MÁS INFORMACIÓN: <a href="http://www.multitop.pe/politicas-privacidad/">http://www.multitop.pe/politicas-privacidad/</a>
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="aviso">
		<xsl:choose>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '01'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">FACTURA ELECTRÓNICA</font>
			</xsl:when>
			<xsl:when test="/pe:Invoice/cbc:InvoiceTypeCode = '03'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">BOLETA ELECTRÓNICA</font>
			</xsl:when>
			<xsl:when test="/pe1:CreditNote">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">NOTA DE CRÉDITO ELECTRÓNICA</font>
			</xsl:when>
			<xsl:when test="/pe2:DebitNote">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">NOTA DE DÉBITO ELECTRÓNICA</font>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="resolucion">
		<xsl:choose>
			<xsl:when test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = '20254134318'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">4082539500115/SUNAT</font>
			</xsl:when>
			<xsl:when test="//cac:AccountingSupplierParty/cbc:CustomerAssignedAccountID = 'NaN'">
				<font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Otros/SUNAT</font>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="timbre">
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe:DatosAdicionales/pe:Documento/pe:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe1:DatosAdicionales/pe1:Documento/pe1:Nombre"/>
		<xsl:value-of select="//ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/pe2:DatosAdicionales/pe2:Documento/pe2:Nombre"/>
		<xsl:value-of select="'.jpg'"/>
	</xsl:template>

	<xsl:template name="nombreTed">
		<xsl:param name="text"/>
		<xsl:param name="largo" select="0"/>
		<xsl:variable name="largo_actual" select="string-length($text)"/>
		<xsl:choose>
			<xsl:when test="$largo_actual &gt;= $largo">
				<xsl:value-of select="$text"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="prefix" select="concat('0', $text)"/>
				<xsl:call-template name="nombreTed">
					<xsl:with-param name="text" select="$prefix"/>
					<xsl:with-param name="largo" select="$largo"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios/>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->