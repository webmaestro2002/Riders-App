<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Rate Your Ride | Ride App</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/components.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/layout.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/rating.css">
</head>

<body class="rating-bg">

<div class="rating-container">
  <div class="card">

    <h2 class="rating-title">Rate Your Ride</h2>
    <p class="rating-subtitle">Your feedback helps us improve</p>

<form class="form" action="<%=request.getContextPath()%>/rating" method="post">


        <div class="rating-group">
            <label for="stars">Rating</label>
            <select class="rating-select" id="stars" name="stars" required>
                <option value="">Select rating</option>
                <option value="1">1 – Very Bad</option>
                <option value="2">2 – Bad</option>
                <option value="3">3 – Okay</option>
                <option value="4">4 – Good</option>
                <option value="5">5 – Excellent</option>
            </select>
        </div>

        <div class="rating-group">
            <label for="comment">Comment (optional)</label>
            <textarea
                class="rating-textarea"
                id="comment"
                name="comment"
                placeholder="Share your experience (optional)">
            </textarea>
        </div>

        <button class="btn-primary" type="submit">
            Submit Rating
        </button>

    </form>

  </div>
</div>

</body>
</html>
