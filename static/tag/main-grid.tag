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
			margin:2px;
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
	{console.log('TAG')}
	<div id="grid_container">
		<div class="item" each={items} onclick="{parent.elegirItemActual}">
			<div class="innerframe"><img src="{this.blobs.thumbnail}"/></div>
			<span class="item-title">{this.name}</span>
			<input type="checkbox" name="itemCheck" class="btnCheckbox"
				onclick="{parent.stopClick}" onchange="{parent.seleccionarItems}"
				checked="{env.seleccion.isselected(this.key)}"/>
		</div>
	</div>
	{console.log('TAG FIN')}
	<script>
		var me = this;
		me.items = [];

		env.cur_collection.on('updated', function(status) {
			if (status == 'success') {
				me.items = this.items;
				me.update();
			}
		});

		elegirItemActual(e) {
			alert("popup")
			if (e.ctrlKey || e.metaKey) {
				e.currentTarget.children.itemCheck.click();
			} else {
				env.cur_item.load(e.item.href);
			}
		}

		seleccionarItems(e) {
			console.log('onchange:seleccionarItems')
			e.stopPropagation();
			/*console.log('e.currentTarget.checked', e.currentTarget.checked);
			me.seleccionarCheckbox(e.currentTarget.checked, e.item);*/

		}

		seleccionarCheckbox(status, item) {
			if (status == true) {
				env.seleccion.add(item.key, item);
			} else {
				env.seleccion.del(item.key);
			}
		}

		stopClick(e) {
			console.log('onclick: stopClick')
			e.stopPropagation();
			alert("stopClick");
			//console.break();
		}
	</script>
</main-grid>
