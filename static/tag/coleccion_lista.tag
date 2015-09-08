<coleccion-lista>
	<ul id="selector-coleccion-lista">
		<li each={ colecciones } riot-tag="coleccion-item"></li>
	</ul>
	<script>
		var me = this;
		me.colecciones = [];

		env.colecciones.on('updated', function(status) {
			if (status == 'success') {
				me.colecciones = env.colecciones.collections;
				me.update();
			}
			var ul = me.root.querySelector('ul');
		});
	</script>
</coleccion-lista>





<!-- Tag_coleccion_item -->
<coleccion-item>
	<style scoped>
		.selected {
			font-weight:bold;
		}
	</style>
	<span onclick="{ goto }" data-href="{ this.href }">{ name }</span>
	<ul>
		<li each={ children } riot-tag="coleccion-item"></li>
	</ul>

	<script>
		var me = this;

		goto(event) {
			var href = event.item.href;
			$('#selector-coleccion-lista').find('li span').removeClass('selected');

			env.cur_coleccion.load(event.item.href)
				.then(function() {
					$(me.root.children[0]).addClass('selected');
			});
		}
	</script>
</coleccion-item>
