<main-grid-header>
	<style scoped>
		.content {
			display: flex;
			flex-wrap;
			padding:5px 0px;
		}
		.item-right {
			display: flex;
			flex-wrap:wrap;
			margin-left: auto;
		}
		.item-right span {
			margin:0 5px;
		}
	</style>
	<div class="content">
		<div>
			<span>home</span><span>/</span>
		</div>
		<div class="item-right">
			<span class="links" onclick="{seleccionarItems}">seleccionar({numeroDeItems} items)</span>
			<span class="links" onclick="{deseleccionarItems}">desseleccionar</span>
			<span class="links">download</span>
			<span>0</span>
		</div>
	</div>
	<script>
		var me = this;
		me.numeroDeItems = 0;

		env.cur_collection.on('updated', function() {
			me.numeroDeItems = this.items.length;
			me.update();
		});

		seleccionarItems(e) {
			var items = env.cur_collection.items;
			if (typeof(items) != 'undefined' && items.length > 0) {
				items.forEach(function(entry) {
					env.seleccion.add(entry.key, entry);
				});
			}
		}

		deseleccionarItems(e) {
			env.seleccion.clear();
		}
	</script>
</main-grid-header>
