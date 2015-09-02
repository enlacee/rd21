<panel-item-seleccionados>
	<h2>Selector de imagenes SVG</h2>
	<div class="red" style="width:250px" >
		<svg viewBox="0 0 300 300" id="panel">
		</svg>
	</div>

	<script>
		var tag = this;
		env.add('tag-panel-item-seleccionados', tag);
		tag.items = [];

		/**
		* Events
		*/
		tag.on('renderSVGClear', function(status) {
			var list = tag.panel;
			list.innerHTML = '';
		});

		tag.on('renderSVG', function(status) {
			var dataItems = tag.items;
			var n = dataItems.length;
			if (n > 0) {
				var sz = Math.max(24*(10-n), 120);
				dataItems.forEach(function(entry, i) {
					var image = entry.blobs.thumbnail;
					var svgimg = document.createElementNS('http://www.w3.org/2000/svg','image');
					svgimg.setAttributeNS(null,'height',sz);
					svgimg.setAttributeNS(null,'width',sz);
					svgimg.setAttributeNS('http://www.w3.org/1999/xlink','href', image);
					svgimg.setAttributeNS(null,'x','0');
					svgimg.setAttributeNS(null,'y','0');
					svgimg.setAttributeNS(null, 'visibility', 'visible');
					var attrTransform = 'translate('+ (60 + (i+0.5)*180/n) +',220) '
						+ 'rotate('+ ((i+0.5)*60/n -30) +') '
						+ 'translate('+ (-10-sz*0.5) +','+ (-(sz+120)/2) +')';
					svgimg.setAttributeNS(null, 'transform', attrTransform);
					tag.root.children[0].children[0].appendChild(svgimg);
				});
			}
		});
	</script>
</panel-item-seleccionados>
