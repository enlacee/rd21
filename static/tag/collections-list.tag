<collections-list>
	<style scoped>
		.selected {
			font-weight: bold;
		}
	</style>
	<ul id="collections_list">
		<li each={collections}
			class="h1 listitem {
				selected: this.href==env.cur_data_images.href
			}"
			onclick={parent.goto}
		>
			{this.name}
			{console.log('this', this)}
			{console.log('this.href', this.href)}
			{console.log('env.cur_collection.href', env.cur_collection.href)}
			{console.log("----------------------------------")}
		</li>
			{console.log('*collections*', collections)}

	</ul>
	<button onclick={reload}>Reload</button>

	<script>
		var me = this;
		env.add('collections-list', this); //agregar coleccion como observable

		// Cargar data (AjaxModel)
		reload(e) {
			env.collections.load();
		}

		// cur_collection (objeto observado) EVENTO CLICK (carga a otro modelo de data)
		// UTIL PARA SELECCIONADO (BOLD)
		goto(e) {
			env.cur_collection.load(e.item.href)
				.then(function() {
				me.update(); // update
				});
		}

		// Creando el CALLBACK trigger lanza, AL terminar el AjaxModel
		env.collections.on('updated', function(status) {
			me.collections = this.collections;
			me.update();
		})

		// execute
		this.reload();


	</script>
</collections-list>
