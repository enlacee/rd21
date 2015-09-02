<main-grid-header>
	<div class="topbar">
		<div class="path">
			<div><span><a href="#">H</a></span><span>/collection</span></div>
		</div>
		<div class="path-others">
			<div>
				<a href="#">Seleccionar </a>
				({env.cur_coleccion.items.length})
				<span if={ (env.cur_coleccion.items.length <= 1) }>Item</span>
				<span if={ (env.cur_coleccion.items.length > 1) }>Items</span>
			</div>
			<div><a href="#">Desseleccionar</a></div>
			<div><a href="#">Dowmload</a></div>
			<div><a href="#">0</a></div>
		</div>
	<div>
	<script>
		var tag = this;
		env.add('tag-main-grid-header', this)

	</script>
	<style type="text/css">
	.topbar {
		border:1px solid blue;
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
</main-grid-header>
