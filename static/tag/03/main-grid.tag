<main-grid>
	<div class="grid-row">
		<div class="item" each={subcollections}>
			<div class="innerframe">colección</div>
			{this.name}
		</div>
	</div>
	<hr>
	<div id="grid_container">
		<div class="item" each={items} onclick={gotoInspector}>
			<div class="innerframe"><img class="thumbnail" src={this.blobs.thumbnail} /></div>
			<span class="item-title">{this.name}</span>
			<input class="btnCheckbox" type="checkbox" name="itemCheck" onclick={gotoShowSelected} />
		</div>
	</div>

	<script>
		var tag = this;
		var localItems;

		env.cur_coleccion.on('updated', function(status) {
			localItems = env.cur_coleccion.items;
			if (env.cur_coleccion.has_children==true) {
				for (var i=0; i<env.cur_coleccion.subcollections.length; i++) {
					var href = env.cur_coleccion.subcollections[i].href
					$.when( subColeccion.load(href) ).done(function(response) {

					});
				}
			}

			tag.items = localItems;
			tag.subcollections = env.cur_coleccion.subcollections;
			tag.update();
		});

		// Crear modelo para cargar los items de la subcoleccion event 'update'
		var subColeccion = new AjaxModel();
		subColeccion.on('updated', function(status) {
			if (subColeccion.items.length > 0) {
				for (var a=0; a<subColeccion.items.length; a++) {
					localItems.push(subColeccion.items[a])
				}
			}
			tag.update();
		});

		gotoInspector(event) {
			event.stopPropagation();
			env.cur_item.load(event.item.href)
				.then(function(status) {
				env['tag-inspector'].shadow.style.display='block'
				env['tag-inspector'].inspector.style.display='block'
				env['tag-inspector'].update();
			});
		}

		// listerner tag
		gotoShowSelected(event) {
			event.stopPropagation();
			if (event.target.checked) {
				var model = new AjaxModel();
				model.load(event.item.href).then(function(status) {
					env['tag-panel-item-seleccionados'].items.push(model);
					env['tag-panel-item-seleccionados'].update();
				});
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
			position: absolute
		}
	</style>
</main-grid>
