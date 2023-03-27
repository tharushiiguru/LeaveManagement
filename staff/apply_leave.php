<?php include('includes/header.php')?>
<?php include('../includes/session.php')?>
<?php
	$total_leaves = 0;
	$leaves_taken = 0;
	if(isset($_POST['apply']))
	{
	$empid=$session_id;
	$leave_type=$_POST['leave_type'];
	$assignee=$_POST['acting_lecturer'];
	$fromdate=date('d-m-Y', strtotime($_POST['date_from']));
	$todate=date('d-m-Y', strtotime($_POST['date_to']));
	$description=$_POST['description'];  
	$status=0;
	$isread=0;

	$datefrom=date_create($_POST['date_from']);
	$dateto=date_create($_POST['date_to']);
	$year_l=$datefrom->format("Y");

	$leave_days=$dateto->diff($datefrom)->format("%d");
	$datePosting = date("Y-m-d");

	$sql = "SELECT SUM(no_of_days) as no_days FROM leavetype_tblemployees WHERE leavetype_no=$leave_type AND emp_id=$empid AND year(leave_date)=$year_l";
	$result = mysqli_query($conn, $sql);
	$no_days_row = mysqli_fetch_array($result);
	$used_days = $no_days_row["no_days"];

	$sql = "SELECT days from leavetype WHERE leavetype_no=$leave_type";
	$result = mysqli_query($conn, $sql);
	$total_days_row = mysqli_fetch_array($result);
	$total_days = $total_days_row["days"];

	$days_left = $total_days - $used_days;

	if($fromdate > $todate)
	{
	    echo "<script>alert('End Date should be greater than Start Date');</script>";
		
	}
	elseif($days_left <= 0)
	{
	    echo "<script>alert('YOU HAVE EXCEEDED YOUR LEAVE LIMIT. LEAVE APPLICATION FAILED');</script>";
		
	} else if ($days_left < $leave_days) {
		echo "<script>alert('YOU DO NOT HAVE THAT MANY LEAVE DAYS LEFT. LEAVE APPLICATION FAILED');</script>";
		
	}
	else {
		
		$DF = date_create($_POST['date_from']);
		$DT = date_create($_POST['date_to']);

		$diff =  date_diff($DF , $DT );
		$num_days = (1 + $diff->format("%a"));

		$leave_d=$DF->format("Y-m-d");
		$leave_e=$DT->format("Y-m-d");

		$status='PENDING';

		// $sql="INSERT INTO tblleaves(LeaveType,ToDate,FromDate,Description,Status,IsRead,empid,num_days,PostingDate) VALUES(:leave_type,:fromdate,:todate,:description,:status,:isread,:empid,:num_days,:datePosting)";
		$sql="INSERT INTO leavetype_tblemployees(leavetype_no,emp_id,assignee_id,description,no_of_days,leave_date,leave_end_date,assignee_status,hod_status) VALUES(:leave_type,:emp_id,:assignee_id,:description,:no_of_days,:leave_date,:leave_end_date,:assignee_status,:hod_status)";
		$query = $dbh->prepare($sql);
		$query->bindParam(':leave_type',$leave_type,PDO::PARAM_INT);
		$query->bindParam(':emp_id',$empid,PDO::PARAM_INT);
		$query->bindParam(':assignee_id',$assignee,PDO::PARAM_INT);
		$query->bindParam(':description',$description,PDO::PARAM_STR);
		$query->bindParam(':no_of_days',$leave_days,PDO::PARAM_INT);
		$query->bindParam(':leave_date',$leave_d,PDO::PARAM_STR);
		$query->bindParam(':leave_end_date',$leave_e,PDO::PARAM_STR);
		$query->bindParam(':assignee_status',$status,PDO::PARAM_STR);
		$query->bindParam(':hod_status',$status,PDO::PARAM_STR);
		$query->execute();
		$lastInsertId = $dbh->lastInsertId();
		if($lastInsertId)
		{
			echo "<script>alert('Leave Application was successful.');</script>";
			echo "<script type='text/javascript'> document.location = 'leave_history.php'; </script>";
		}
		else 
		{
			echo "<script>alert('Something went wrong. Please try again');</script>";
		}

	}

}

?>

<script>
	function setTotalLeavesJS() {
		d = document.getElementById("leave_type").value;
		console.log(d);
		document.getElementById("leave_days").value = d
	}
</script>
<body>

	<?php include('includes/navbar.php')?>

	<?php include('includes/right_sidebar.php')?>

	<?php include('includes/left_sidebar.php')?>

	<div class="mobile-menu-overlay"></div>

	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pb-20">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
							<div class="title">
								<h4>Leave Application</h4>
							</div>
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">Apply for Leave</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>

				<div style="margin-left: 50px; margin-right: 50px;" class="pd-20 card-box mb-30">
					<div class="clearfix">
						<div class="pull-left">
							<h4 class="text-blue h4">Staff Form</h4>
							<p class="mb-20"></p>
						</div>
					</div>
					<div class="wizard-content">
						<form method="post" action="">
							<section>

								<?php if ($role_id = 'Staff'): ?>
								<?php $query= mysqli_query($conn,"select * from tblemployees where emp_id=$session_id")or die(mysqli_error());
									$row = mysqli_fetch_array($query);
								?>
						
								<div class="row">
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label >First Name </label>
											<input name="firstname" type="text" class="form-control wizard-required" required="true" readonly autocomplete="off" value="<?php echo $row['FirstName']; ?>">
										</div>
									</div>
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label >Last Name </label>
											<input name="lastname" type="text" class="form-control" readonly required="true" autocomplete="off" value="<?php echo $row['LastName']; ?>">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label>Designation</label>
											<input name="Designation" type="text" class="form-control" required="true" autocomplete="off" readonly value="<?php echo $row['role']; ?>">
										</div>
									</div>
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label>Department</label>
											<input name="department" type="text" class="form-control" required="true" autocomplete="off" readonly value="<?php echo $row['Department']; ?>">
										</div>
									</div>
									<?php endif ?>
								</div>
								<div class="row">
									<div class="col-md-12 col-sm-12">
										<div class="form-group">
											<label>Leave Type :</label>
											<select id="leave_type" name="leave_type" class="custom-select form-control" required="true" autocomplete="off" onchange="setTotalLeavesJS()">
											<option value="">Select leave type...</option>
											<?php $sql = "SELECT  * from leavetype";
											$query = $dbh -> prepare($sql);
											$query->execute();
											$results=$query->fetchAll(PDO::FETCH_OBJ);
											$cnt=1;
											if($query->rowCount() > 0)
											{
											foreach($results as $result)
											{   ?>                                            
											<option value="<?php echo htmlentities($result->leavetype_no);?>"><?php echo htmlentities($result->leave_type);?></option>
											<?php }} ?>
											</select>
										</div>
									</div>
								</div>
								<!-- <div class="row">
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label>Available Leave Days</label>
											<input id="leave_days" name="leave_days" type="text" class="form-control" required="true" autocomplete="off" readonly value="<?php global $total_leaves, $leaves_taken; echo htmlentities($total_leaves - $leaves_taken) ?>">
										</div>
									</div>
								</div> -->
								<div class="row">
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label>Start Leave Date :</label>
											<input name="date_from" type="text" class="form-control date-picker" required="true" autocomplete="off">
										</div>
									</div>
									<div class="col-md-6 col-sm-12">
										<div class="form-group">
											<label>End Leave Date :</label>
											<input name="date_to" type="text" class="form-control date-picker" required="true" autocomplete="off">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 col-sm-12">
										<div class="form-group">
											<label>Acting Lecturer : </label>
											<select name="acting_lecturer" class="custom-select form-control" required="true" autocomplete="off">
											<?php $sql = "SELECT emp_id,FirstName, LastName FROM tblemployees WHERE role='Staff' AND emp_id!=$session_id";
											$query = $dbh -> prepare($sql);
											$query->execute();
											$results=$query->fetchAll(PDO::FETCH_OBJ);
											$cnt=1;
											if($query->rowCount() > 0)
											{
											foreach($results as $result)
											{   ?>                                            
											<option value="<?php echo htmlentities($result->emp_id);?>"><?php echo htmlentities($result->FirstName . " " . $result->LastName);?></option>
											<?php }} ?>
											</select>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-8 col-sm-12">
										<div class="form-group">
											<label>Reason For Leave :</label>
											<textarea id="textarea1" name="description" class="form-control" required length="150" maxlength="150" required="true" autocomplete="off"></textarea>
										</div>
									</div>
									<div class="col-md-4 col-sm-12">
										<div class="form-group">
											<label style="font-size:16px;"><b></b></label>
											<div class="modal-footer justify-content-center">
												<button class="btn btn-primary" name="apply" id="apply" data-toggle="modal">Apply&nbsp;Leave</button>
											</div>
										</div>
									</div>
								</div>
							</section>
						</form>
					</div>
				</div>

			</div>
			<?php include('includes/footer.php'); ?>
		</div>
	</div>
	<!-- js -->
	<?php include('includes/scripts.php')?>
</body>
</html>