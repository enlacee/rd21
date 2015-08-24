<main-grid>
	<div id="grid_container">
		<div class="item" onclick={abrirInspector} each={items}>
			<div class="innerframe"><img src={this.blobs.thumbnail}/></div>
			{this.name}
		</div>
	</div>
	<script>
		var me = this;
		env.add('main-grid', this);
		
		env.cur_collection.on('updated', function(status) {
			me.items = this.items;
			me.update();
		});

		abrirInspector(e) {
			alert("event "+this.href )
			env.cur_item.load(this.href)
				.then(function(status) {
					env['tag-inspector'].update();
			});
		}

	</script>
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
		}
		.item img {
			max-width: 120px;
			height: auto;
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
	</style>
</main-grid>
