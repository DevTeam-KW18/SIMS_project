<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ȸ��</title>
</head>
<style>
	@import url(https://cdn.rawgit.com/theeluwin/NotoSansKR-Hestia/master/stylesheets/NotoSansKR-Hestia.css);
	
	body{
		font-family:'Noto Sans Korean';
	}
  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
  }
</style>
<body>
<form autocomplete="off" role="form" method="post" action="/SIMS/Registration/enroll">
		<script>
		if(!${validate}){
			alert('�̹� ��ٱ��Ͽ� �����մϴ�');
			location.href="/SIMS/Registration/list";
		}
		else{
			alert('��ٱ��Ͽ� �����߽��ϴ�.');
			location.href="/SIMS/Registration/list";
		}
		</script>
		<input type="hidden"id="course_number" name="course_number" value="${course_number}">
		<meta http-equiv='refresh' content='0;url="/SIMS/Registration/list"'>
</form>
</body>
</html>