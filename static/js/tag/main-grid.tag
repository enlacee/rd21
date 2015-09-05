<main-grid>
	<div class="grid-row">
		<div class="item" each={ subcoleccion }>
			<div class="innerframe">colección</div>
			{this.name}
		</div>
	</div>
	<hr>
	<div id="grid_container">
		<div class="item" each={ items } onclick={ abrirInspector }>
			<div class="innerframe">
				<img class="thumbnail" src="{ this.blobs.thumbnail }" />
			</div>
			<span class="item-title">{ this.name }</span>
			<input type="checkbox" name="itemCheck" value="" class="btnCheckbox"
				onclick="{ seleccionarItem }">
		</div>
	</div>

	<script>
	// require
	// model_subColeccion : /static/js/tag/model/subColeccion.js
		var tag = this;
		env.add('main-grid', tag);
		tag.items = [];

		env.cur_coleccion.on('updated', function(status) {
			tag.items = env.cur_coleccion.data.items;
			env.main_grid_header.update();
			//
			if (env.cur_coleccion.has_children == true) {
				var cnt = env.cur_coleccion.subcollections.length;
				for (var i = 0; i < cnt; i++) {
					var href = env.cur_coleccion.subcollections[i].href;
					$.when(model_subColeccion.load(href)).done(function(response) {
						tag.update();
						env.main_grid_header.update();
					});
				}
			}
			//
			tag.subcoleccion = env.cur_coleccion.subcollections;
			tag.update();
		});

		// Event handler
		abrirInspector(event) {
			event.stopPropagation();
			env.cur_item.traerDatos(event.item.href);
		}

		seleccionarItem(event) {
			event.stopPropagation();
			var rsObjeto = env.cur_items_selected.buscarItem(event.item.href);

			if (event.target.checked == true) {
				if (rsObjeto == false) {
					env.cur_items_selected.agregar(event.item);
				}
			} else {
				env.cur_items_selected.remover(rsObjeto.indice);
			}
		}

	</script>
	<style scoped>
		.grid-row {
			display: flex;
			flex-flow: row wrap;
		}
		#grid_container {
			display: flex;
			flex-flow: row wrap;
		}
		.item {
			width: 120px;
			height: 120px;
			padding: 5px;
			padding-bottom: 50px;
			text-align: center;
			font-size: 8pt;
			border:1px solid gray;
			margin:2px
		}
		.item img {
			max-width: 120px;
			height: auto;
			vertical-align: middle;
			display: inline-block;
		}
		.item .item-title {
			position: relative;
			color: black;
			display: block;
			background-color: rgba(255,255,255, 0.7);
		}
		.thumbnail {
			vertical-align: middle;
			display: inline-block;
		}
		.innerframe {
			position:relative;
			width:120px;
			height:120px;
			white-space: nowrap;
			font-size: 0;
		}
		.innerframe::before {
			display: inline-block;
			vertical-align: middle;
			height: 100%;
			content: "";
		}
		.btnCheckbox {
			display: inline-block;
		    position: relative;
		    left: 57px;
		}
	</style>
</main-grid>
