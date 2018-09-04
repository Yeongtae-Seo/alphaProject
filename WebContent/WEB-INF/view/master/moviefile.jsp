<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.ta {
	resize: none;
	rows: 100;
}
</style>

<!-- 영화 관리자 페이지 -->
<div style="height: 20px"></div>


<!-- 영화 정보 입력,삭제 -->
<div class="w3-container" align="center">
	<h4>영화 DB 관리</h4>
</div>
<form class="w3-container" action="/master/addMovieFile.do"
	enctype="multipart/form-data" method="post" autocomplete="off">
	<div align="center">
		<div class="w3-card-4 w3-margin-bottom" align="center"
			style="width: 50%;">
			<div class="w3-container w3-margin-bottom" align="center">

				<p>
					<b>parent</b><input class="w3-input w3-border w3-sand"
						name="parent" type="text" value="${parent }" readonly />
				</p>


				<p>
					<b>File</b>
					<input class="w3-input w3-border w3-sand" name="attach" type="file"
						style="display: none;" multiple required id="ori"> <select
						class="w3-input w3-border w3-sand" multiple 
						id="fake" >
						</select>
					<script>
						$("#fake").on("click", function() {
							$("#ori").trigger("click");
						});
						$("#ori").on("change", function() {
							var p = new Array();
							$("#fake").html("");
							for (var i = 0; i < this.files.length; i++) {
								// p.push(this.files[i].name);
								$("#fake").append("<option disabled>"+this.files[i].name+"</option>")
							}
							console.log(p);
							p.join();
							// $("#fake").val(p);
						});
					</script>
				</P>
				<P>
				<button class="w3-btn w3-black" type="submit">입력</button>
				<a href="/master/showMovie.do"><button type="button"
						class="w3-btn w3-black">취소</button></a>
				</p>
			</div>
		</div>
	</div>

</form>