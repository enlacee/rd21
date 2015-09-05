<main-grid-header>
	<style scoped>
	.topbar {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
	}
	.topbar > div.path {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
	}
	.topbar > div.path-others {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		margin-left: auto;
	}
	.topbar > div.path-others > div {
		padding:0 5px;
	}
	</style>
	<div class="topbar">
		<div class="path">
			<div><span><a href="#">H</a></span><span>/collection</span></div>
		</div>
		<div class="path-others">
			<div>
				<a href="#">Seleccionar</a>({ items.length })
				<span if={ (env.cur_coleccion.items.length <= 1) }>Item</span>
				<span if={ (env.cur_coleccion.items.length > 1) }>Items</span>
			</div>
			<div><a href="#">Desseleccionar</a></div>
			<div><a href="#">Dowmload</a></div>
			<div><a href="#">0</a></div>
		</div>
	<div>
	<script>
		var me = this;
		me.items = [];
		env.add('main_grid_header', me);

		me.on('render', function(objeto) {
			me.items = objeto.data;
			me.update();
		});
	</script>
</main-grid-header>
