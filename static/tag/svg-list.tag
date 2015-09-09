<svg-list>
	<svg viewBox="0 0 300 300" name="panel" />
	<script>
		var tag = this;
		tag.items = [];

		env.seleccion.on('render', function(object) {
			tag.items = object.itemsArray;
			tag.limpiarSvg();
			tag.dibujarSvg();
			tag.update();
		});

		limpiarSvg() {
			var list = tag.panel;
			var shadow = ''
			+'<filter id="dropShadow">'
			+'	<feGaussianBlur in="SourceAlpha" stdDeviation="3" />'
			+'	<feOffset dx="2" dy="4" />'
			+'	<feMerge>'
			+'		<feMergeNode />'
			+'		<feMergeNode in="SourceGraphic" />'
			+'	</feMerge>'
			+'  </filter>';
			list.innerHTML  = shadow;
		}

		dibujarSvg() {
			var dataItems = tag.items;
			var n = dataItems.length;
			if (n > 0) {
				var sz = Math.max(24*(10-n), 120);
				dataItems.forEach(function(entry, i) {
					var image = entry.blobs.preview;
					var svgimg = document.createElementNS('http://www.w3.org/2000/svg', 'image');
					svgimg.setAttributeNS(null, 'height', sz);
					svgimg.setAttributeNS(null, 'width', sz);
					svgimg.setAttributeNS('http://www.w3.org/1999/xlink', 'href', image);
					svgimg.setAttributeNS(null, 'x', '0');
					svgimg.setAttributeNS(null, 'y', '0');
					svgimg.setAttributeNS(null, 'visibility', 'visible');
					svgimg.setAttributeNS(null, 'filter', 'url(#dropShadow)');

					var attrTransform = 'translate('+ (60 + (i+0.5)*180/n) +',220) '
						+ 'rotate('+ ((i+0.5)*60/n -30) +') '
						+ 'translate('+ (-10-sz*0.5) +','+ (-(sz+120)/2) +')';
					svgimg.setAttributeNS(null, 'transform', attrTransform);
					tag.panel.appendChild(svgimg);
				});
			}
		}
	</script>
</svg-list>
