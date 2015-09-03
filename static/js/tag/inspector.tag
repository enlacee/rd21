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
		var tag = this;
		env.add('tag-inspector', this);

		env.cur_item.on('updated', function(status) {
			tag.data = env.cur_item
			tag.update()
		});

		ocultarVentana(e) {
			tag.shadow.style.display = 'none';
			tag.inspector.style.display = 'none';
		}
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
