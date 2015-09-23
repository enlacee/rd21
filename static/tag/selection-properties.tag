<selection-properties>
	<div>
		<div>{numeroDeItems} items
			(<span class="links" onclick="{limpiar}">limpiar</span>)
		</div>
		<div>
			<div class="links" onclick="{toogleMetadata}">Metadata</div>
			<div name="metadataDetail" style="display:none">
				<p>Aprobación</p>
				<p>Expiración</p>
			</div>
		</div>
		<div><span class="links">Colección</span></div>
		<div><span class="links">Download</span></div>
		<div><span class="links">Download Previews</span></div>
		<div><span class="links">Contact Sheet</span></div>
		<div><span class="links">Reporte</span></div>
	</div>
	<script>
		var me = this;
		me.numeroDeItems = 0;

		env.seleccion.on('updated', function() {
			me.numeroDeItems = this.length();
			me.update();
		});

		limpiar() {
			env.seleccion.clear();
		}

		toogleMetadata(e) {
			var display = me.metadataDetail.style.display;
			if (display == 'none') {
				me.metadataDetail.style.display = 'block';
			} else {
				me.metadataDetail.style.display = 'none';
			}


		}
	</script>
</selection-properties>
