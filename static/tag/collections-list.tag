<collections-list>
	<ul id="collections_list">
		<li riot-tag="collection-item" each={collections}/>
	</ul>
	<button onclick={reload}>Reload</button>

	<script>
		var me = this;
		env.add('collections-list', this);

		reload(e) {
			env.collections.load();
		}

		env.collections.on('updated', function(status) {
			me.collections = this.collections;
			me.update();
		})

		this.reload();
	</script>
</collections-list>
