<anb-list-coleccion>
	<ul id="anb_list_coleccion_id">
		<ul>
			<li each={collections} riot-tag="anb-coleccion"></li>
		</ul>
	</ul>

	<script>
		var me = this;
		console.log('anb_list_coleccion', env.anb_list_coleccion);

		/*//(3) cargar objeto de ayuda (marcar en negrita) (evento click)
		goto(e) {
			env.anb_cur_collection.load(e.item.href)
				.then(function() {
				me.update(); // update
				console.log('dta.ok', env.anb_cur_collection);
				});
		}*/

		//(2) construcion del callback a llamar ()
		env.anb_list_coleccion.on('updated', function(status) {
			me.collections = this.collections;
			me.update();

		})

		// start
		env.anb_list_coleccion.load();
	</script>
</anb-list-coleccion>
