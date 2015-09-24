<inspector>
	<style scoped>
		.shadow {
			position: fixed;
			top: 0vh;
			left: 0vw;
			width: 100vw;
			height: 100vh;
			z-index: 500;
			background-color: black;
			opacity: 0.2;
		}
		.inspector {
			width: 50vw;
			background-color: white;
			overflow: auto;
		}
		.box {
			position: fixed;
			top: 1vh;
			bottom: 1vh;
			right: -52vw;
			padding: 1vw;
			z-index: 600;
			transition:all 0.3s ease-out;
		}
		.inspector-open {
			right: 1vw;
		}

		.close {
			float:right;
		}
	</style>
	<div name="shadow" class="shadow" style="display:none" onclick="{cerrar}"></div>
	<div name="inspector" class="box inspector {inspector-open: visible}">
		<span onclick="{cerrar}" class="close">
			<span class="links">cerrar</span>
		</span>
		{data.name}
		<hr>
		<div style="width: 40%">
			<a href="{data.blobs.preview}" target="_blank">
				<img src="{data.blobs.preview}" width="100%"/>
			</a>
		</div>
		<div style="width: 50%">
			metadata : message
		</div>
	</div>
	<script>
		var me = this;
		me.data = [];
		me.visible = false;

		env.cur_item.on('updated', function(status) {
			if (status == 'success') {
				me.abrir();
				me.data = this;
				me.update()
			}
		});

		cerrar(e) {
			me.shadow.style.display = 'none';
			me.visible = false;
		}

		abrir() {
			me.shadow.style.display = 'block';
			me.visible = true;
		}
	</script>
</inspector>
