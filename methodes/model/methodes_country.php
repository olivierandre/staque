<?php
	function getAllCountries() {
		$dbh = connectDBH();
		$sql = "SELECT country_code, country_name FROM tech_countries
				ORDER BY country_name";

		$stmt = $dbh->prepare($sql);
		$stmt->execute();
		$countries = $stmt->fetchAll();

		closeDBH($dbh);
		return $countries;
	}
?>
