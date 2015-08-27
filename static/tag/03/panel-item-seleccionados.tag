<panel-item-seleccionados>
	<div class="red" style="border:1px solid red; width:300px" data-render="{random}">
		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
			<image x="20" y="20" width="300" height="80" xlink:href="http://jenkov.com/images/layout/top-bar-logo.png" />
			<image x="20" y="20" width="300" height="80" each={item, i in items} xlink:href="{item.blobs.thumbnail}" />
		</svg>
	</div>


	<script>
		var tag = this;
		env.add('tag-panel-item-seleccionados', tag);
		tag.items = [];

		tag.test = [
			{img: "http://localhost:8000/media/blobs/i-15_v-15_thumbnail.jpeg"},
			{img: "http://localhost:8000/media/blobs/i-15_v-15_thumbnail.jpeg"},
			{img: "http://localhost:8000/media/blobs/i-15_v-15_thumbnail.jpeg"},
		];
	</script>
</panel-item-seleccionados>
