<main-grid>
	<style scoped>
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

	<div id="grid_container">
		<div class="item" each={ items } onclick="{ elegirItemActual }">
			<div class="innerframe">
				<img class="thumbnail" src="{ this.blobs.thumbnail }" />
			</div>
			<span class="item-title">{ this.name }</span>
			<input type="checkbox" name="itemCheck" class="btnCheckbox"
				onclick="{ seleccionarItems }">
		</div>
	</div>

	<script>
		var me = this;
		me.items = [];

		env.cur_coleccion.on('updated', function(status) {
			if (status == 'success') {
				me.items = env.cur_coleccion.items;
				me.update();
			}
		});

		elegirItemActual(event) {
			event.stopPropagation();
			env.cur_item.load(event.item.href);
		}

		// mostrados items en SVG
		seleccionarItems(event) {
			event.stopPropagation();
			if (event.target.checked == true) {
				env.seleccion.add(event.item);
			} else {
				env.seleccion.del(event.item.key);
			}
		}
	</script>
</main-grid>
