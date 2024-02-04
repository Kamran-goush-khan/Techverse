function doLike(pId, uId) {

	const d = {
		pId: pId,
		uId: uId,
		operation: 'like',
	}


	$.ajax({
		url: 'LikeServlet',
		data: d,
		method: 'POST',
		success: function(data, textStatus, jqXHR) {
			console.log(data);
			if (data.trim() === 'insert') {
				let c = $('.liked-count').html();
				$('#liked-count').addClass('fa-beat-fade');
				c++;
				$('.liked-count').html(c);
				setTimeout(() => {
					$('#liked-count').removeClass('fa-beat-fade');
				}, 1000);
			}
			else if (data.trim() === 'delete') {
				let c = $('.liked-count').html();
				$('#liked-count').addClass('fa-thumbs-down');
				c--;
				$('.liked-count').html(c);
				setTimeout(() => {
					$('#liked-count').removeClass('fa-thumbs-down');
				}, 1000);
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(data);
		},
	})

}