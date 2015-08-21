<anb-coleccion>
	<li>{name}</li>
	<ul>
		<li each={this.children} riot-tag="anb-coleccion" onclick="{clickColeccion}"
		data-url={this.href}/>
	</ul>

	<script>

	clickColeccion(e) {
		console.log('e.this', e)
	}


	</script>
</anb-coleccion>
