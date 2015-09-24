<inspector>
	<style scoped>
		.shadow {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			z-index: 500;
			background-color: black;
			opacity: 0.2;
		}
		.inspector {
			width: 50%;
			background-color: white;
			overflow: auto;
		}
		.box {
			position: fixed;
			top: 1%;
			bottom: 1%;
			right: -52%;
			padding: 1%;
			z-index: 600;
			right: right: -52%;
		}
		.inspector-open {
			-webkit-transition: all 3ms ease-in-out;
			-moz-transition: all 3ms ease-in-out;
			-ms-transition: all 3ms ease-in-out;
			-o-transition: all 3ms ease-in-out;
			transition:all 0.3s ease-in-out;
			right: 1%;
		}
		.inspector-close {
			-webkit-transition: all 3ms ease-in-out;
			-moz-transition: all 3ms ease-in-out;
			-ms-transition: all 3ms ease-in-out;
			-o-transition: all 3ms ease-in-out;
			transition:all 0.3s ease-in-out;
		}

		.close {
			float:right;
		}
	</style>
	<div name="shadow" class="shadow" style="display:none" onclick="{cerrar}"></div>
	<div name="inspector" class="box inspector {inspector-open: visible, inspector-close: !visible}">
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
