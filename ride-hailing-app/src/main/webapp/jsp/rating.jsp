<html>
<head>
    <title>Rating</title>
</head>
<body>
<h2>Rate Your Ride</h2>

<form action="<%=request.getContextPath()%>/rating" method="post">
    Rating:
    <select name="stars">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select><br/><br/>

    Comment:<br/>
    <textarea name="comment"></textarea><br/><br/>

    <button type="submit">Submit Rating</button>
</form>
</body>
</html>
