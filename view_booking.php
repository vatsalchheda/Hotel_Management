<?php
include "db.php";
?>

<?php
function confirm($result){
    global $con;
    if(!$result){
        die("Query failed".mysqli_error($con));
    }
}

if(isset($_POST['search'])){
    $booking_id=$_POST['booking_id'];
    header("Location: confirmation.php?u={$booking_id}");
  }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/bdd89edb33.js"></script>
    <link
      href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900"
      rel="stylesheet"
    />
    <link href="css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="Search.css" />
    <link rel="stylesheet" href="./css/style.css" />
    <title>Sun Of Beach Hotels</title>
</head>
<body>
  <?php include "include/navigation.php" ?>

  <div class="SearchContainer">
    <form action="" method="post" enctype="multipart/form-data">
      <br><br><br>
      <div class="FormDiv" style="min-height:84vh;">
          <h1>View Your Booking</h1>
          <br>
          <div>
            <label>Enter your Booking ID</label>
            <input type="number" id="booking_id" name="booking_id"  required>
            <input type="submit" name="search" class="btn--green btn-submit">
          </div>
      </div>
    </form>
  </div>
  <!-- SIMRN CODE OF INVOICE -->
        <?php include "include/footer.php" ?>

       <!-- jQuery -->
    <script src="js/jquery-2.1.4.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap-3.1.1.min.js"></script>
</body>
</html>