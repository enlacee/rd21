<main-grid-header>
	<style scoped>
		#content {
			display: flex;
			flex-wrap: wrap;
			padding:5px 0px;
		}
		.item-right {
			display: flex;
		    flex-wrap: wrap;
		    margin-left: auto;
		}
		.item-right span {
			margin:0 5px;
		}
	</style>

	<div id="content" style="border:1px solid red">
		<div>
			<span>home</span> <span>/</span>
		</div>
		<div class="item-right">
			<span class="links" onclick="{ seleccionarItems }">seleccionar({ numeroDeitems } items)</span>
			<span class="links" onclick="{ deseleccionarItems }">desseleccionar</span>
			<span class="links">download</span>
			<span>0</span>
		</div>
	</div>

	<script>
		var me = this;
		me.numeroDeitems = 0;

		// Actualizar contador
		env.cur_coleccion.on('actualizarTagHeader', function() {
			me.numeroDeitems = env.cur_coleccion.items.length;
			me.update();
		});

		seleccionarItems(event) {
			var items = env.cur_coleccion.items;
			items.forEach(function(entry) {
				env.seleccion.add(entry.key, entry);
			});
		}

		deseleccionarItems(event) {
			env.seleccion.clear();
		}

	</script>
</main-grid-header>
