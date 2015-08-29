<panel-item-seleccionados>
	<div class="red" style="border:1px solid red; width:250px">
		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
			<image x="20" y="20" width="300" height="80" xlink:href="http://jenkov.com/images/layout/top-bar-logo.png" />
			<image x="20" y="20" width="300" height="90" each="{item, i in items}" xlink:href="{item.blobs.thumbnail}"></image>
		</svg>
	</div>


	<script>
		var tag = this;
		env.add('tag-panel-item-seleccionados', tag);
		tag.items = [];
	</script>
</panel-item-seleccionados>
