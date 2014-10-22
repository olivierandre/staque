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

	function getCountryViaId($country_code) {
		$dbh = connectDBH();
		$sql = "SELECT country_name FROM tech_countries
				WHERE country_code = :country_code";

		$stmt = $dbh->prepare($sql);
		$stmt->bindValue(':country_code', $country_code);
		$stmt->execute();
		$country = $stmt->fetchColumn();

		closeDBH($dbh);
		return $country;
	}
?>
