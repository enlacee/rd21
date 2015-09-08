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
		#inspector {
			width: 50%;
			overflow: auto;
			right: 1%;
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
	<div name="shadow" class="shadow" style="display:none" onclick={ cerrar }>
	</div>
	<div name="inspector" id="inspector" class="rightdrawer position">
		<span onclick={ cerrar } class="closebutton-inspector">
			<a href="#">cerrar</a>
		</span>
		{ data.name }
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

		env.cur_item.on('updated', function(status) {
			if (status == 'success') {
				me.abrir();
				me.data = env.cur_item;
				me.update();
			}
		});

		cerrar(event) {
			me.shadow.style.display = 'none';
			me.inspector.style.display = 'none';
		}

		abrir() {
			me.shadow.style.display = 'block';
			me.inspector.style.display = 'block';
		}
	</script>
</inspector>
