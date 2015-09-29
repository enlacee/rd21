<svg-list>
	<svg viewBox="0 0 300 300" name="panel" />
	<script>
		var tag = this;
		tag.items = [];

		env.seleccion.on('updated', function() {
			tag.limpiarSvg();
			tag.dibujarSvg();
			tag.update();
		});

		limpiarSvg() {
			tag.panel.innerHTML = '';
			var filter = document.createElementNS('http://www.w3.org/2000/svg', 'filter');
			filter.setAttributeNS(null, 'id', 'dropShadow');

			var gaussianFilter = document.createElementNS("http://www.w3.org/2000/svg", "feGaussianBlur");
			gaussianFilter.setAttribute("in","SourceAlpha");
			gaussianFilter.setAttribute("stdDeviation","3");
			filter.appendChild(gaussianFilter);

			var feOffset = document.createElementNS("http://www.w3.org/2000/svg", "feOffset");
			feOffset.setAttribute("dx","2");
			feOffset.setAttribute("dy","4");
			filter.appendChild(feOffset);

			var feMerge = document.createElementNS("http://www.w3.org/2000/svg", "feMerge");
			filter.appendChild(feMerge);

			var feMergeNode = document.createElementNS("http://www.w3.org/2000/svg", "feMergeNode");
			feMerge.appendChild(feMergeNode);

			var feMergeNode_in = document.createElementNS("http://www.w3.org/2000/svg", "feMergeNode");
			feMergeNode_in.setAttribute('in', 'SourceGraphic');
			feMerge.appendChild(feMergeNode_in);

			tag.panel.appendChild(filter);
		}

		dibujarSvg() {
			var n = env.seleccion.length();
			var sz = Math.max(24*(10-n), 120);

			var docfragment = document.createDocumentFragment();
			env.seleccion.each(function (i, entry) {
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

				docfragment.appendChild(svgimg);
			});
			tag.panel.appendChild(docfragment);
		}
	</script>
</svg-list>
