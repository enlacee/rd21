<collection-item >
	<style scoped>
		.selected {
			font-weight: bold;
		}
	</style>
	<span onclick={goto} class="h2 listitem {
			selected: this.href==env.cur_collection.href
		}">{name}</span>
	<ul>
		<li riot-tag="collection-item" each={this.children}/>
	</ul>
	<script>
		var me = this;
		goto(e) {
			env.cur_collection.load(this.href)
				.then(function() {
					env.collections_list.update();
			});
		}
	</script>
</collection-item>
