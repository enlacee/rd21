<main-grid>
	<style scoped>
		#grid_container {
			display: -webkit-flex;
			display: flex;
			-webkit-flex-flow: row wrap;
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
	{ console.log('dentro TAG') }
	<div id="grid_container">
		<div class="item" each={ items } onclick="{ elegirItemActual }" >
			{ console.log('inicio each CLICK EACH') }
			<div class="innerframe">
				<img class="thumbnail" src="{ this.blobs.thumbnail }" />
			</div>
			<span class="item-title">{ this.name }</span>
			<input type="checkbox" name="itemCheck" checked="{ env.seleccion.isselected(this.key) }" class="btnCheckbox"
				onclick="{ parent.stopClick }" onchange="{ seleccionarItems }">
				{ console.log('fin each CLICK EACH') }
		</div>
	</div>

	<script>
		var me = this;
		me.items = [];
		me.done = true;
		console.log("main-grid : TAG:load ")
		env.cur_coleccion.on('updated', function(status) {
			if (status == 'success') {
				me.items = env.cur_coleccion.items;
				me.update();
				console.log("main-grid : on : updated")
			}
		});

		// Abrir inspector
		elegirItemActual(event) {
			if (event.ctrlKey || event.metaKey) {
				event.currentTarget.children.itemCheck.click();
			} else {
				env.cur_item.load(event.item.href);
			}
		}

		// mostrados items en SVG
		seleccionarItems(event) {
			console.log("ONCHANGE checkbox")
			event.stopPropagation();
			var checkbox = event.currentTarget;
			//console.log('checkbox.checked',checkbox.checked)
			me.seleccionarCheckbox(checkbox.checked, event.item);
		}

		/*
		// onclick
		seleccionarItems(event) {
			event.stopPropagation();
			var checkbox = event.currentTarget;
			me.seleccionarCheckbox(checkbox.checked, event.item);
		}*/

		seleccionarCheckbox(status, item) {
			console.log('status checkbox', status)
			if (status == true) {
				env.seleccion.add(item.key, item);
			} else {
				env.seleccion.del(item.key);
			}
		}

		stopClick(e) {
			e.stopPropagation();
		}
	</script>
</main-grid>
