<inspector>
	<div name="shadow" class="shadow" style="display:none" onclick={ocultarVentana}>
	</div>
	<div name="inspector" id="inspector" class="rightdrawer position">
		<span onclick={ocultarVentana} class="closebutton-inspector">
			<a href="#">cerrar</a>
		</span>
		{data.name}
		<hr>
		<div style="width:40%" class="blue">
			<a href="{ data.blobs.preview }" target="_blank">
				<img src="{ data.blobs.preview }" width=100% alt="{ data.name }" />
			</a>
		</div>

		<div style="width:50%" class="blue">
			metadata : message
		</div>
	</div>
	<script>
		var me = this;
		me.data = [];
		env.add('inspector', me);

		me.on('mostrarItem', function(objeto) {
			me.shadow.style.display = 'block';
			me.inspector.style.display = 'block';
			me.data = objeto.data;
			me.update();
		});

		// Event Handler
		ocultarVentana(event) {
			me.shadow.style.display = 'none';
			me.inspector.style.display = 'none';
		}
/*
		mostrarVentana(event) {
			me.shadow.style.display = 'block';
			me.inspector.style.display = 'block';
		}*/
	</script>
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
	#inspector {
		width: 50%;
		overflow: auto;
		top: 1%;
		display: none;
    }
	.rightdrawer {
		position: fixed;
		right: 5%;
		bottom: 5%;
		z-index: 600;
		padding: 1%;
	}
	.closebutton-inspector {
		float:right;
	}
	</style>
</inspector>
