<inspector>
	<div name="shadow" id="shadow" class="shadow" style="display:none" onclick={ocultarVentana}></div>
	<div name="inspector" id="inspector" class="pane z4 rightdrawer" style="overflow: auto; right: 0.7%; display:none">
	<span onclick={ocultarVentana} class="closebutton-inspector"><a href="#">cerrar</a></span>
		{data.name}
		<hr>

		<div style="width:40%" class="blue">
			<img src="{data.blobs.preview}" width=100% alt="{data.name}"/>
		</div>

		<div style="width:50%" class="blue">
			metadata : message
		</div>

	</div>
	<script>
		var tag = this;
		env.add('tag-inspector', this)

		env.cur_item.on('updated', function(status) {
			tag.data = env.cur_item
			tag.update()
			
		});

		ocultarVentana(e) {
			tag.shadow.style.display='none'
			tag.inspector.style.display='none'
		}
	</script>
	<style>
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
		right: 50%;
		width: 50%;
    }

	.rightdrawer {
		position: fixed;
		top: 5%;
		bottom: 5%;
		z-index: 600;
		padding: 1%;
	}
	.closebutton-inspector {
		float:right;
	}
	</style>
</inspector>
