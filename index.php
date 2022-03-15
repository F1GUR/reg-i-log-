<link href="style.css" rel="stylesheet" >
<?php

if (isset($_REQUEST['action']) && $_REQUEST['action'] == "login") {

$email = $_REQUEST['email'];
$password = $_REQUEST['password'];

$email = filter_var($email, FILTER_SANITIZE_EMAIL);

$db = new mysqli("localhost", "root", "", "auth");

//$q = "SELECT * FROM user WHERE email = '$email'";
//echo $q;
//secretPassword

$q = $db->prepare("SELECT * FROM user WHERE email = ? LIMIT 1");
$q->bind_param("s", $email);

$q->execute();
$result = $q->get_result();

$userRow = $result->fetch_assoc();

if($userRow == null){
    echo "Wrong Email or password <br>";

}else{

    if (password_verify($password, $userRow['passwordHash'])){

        echo "Logged in properly <br>";
    } else {
        echo "Wrong Email or password <br>";
    }

}
}
if (isset($_REQUEST['action']) && $_REQUEST['action'] == "register"){
    $db = new mysqli("localhost", "root", "", "auth");
    $email = $_REQUEST['email'];
    $password = $_REQUEST['password'];
    $passwordRepeat = $_REQUEST['passwordRepeat'];

    
    if($password == $passwordRepeat) {
$q = $db->prepare("INSERT INTO user VALUES (NULL, ?, ?)");
$passwordHash = password_hash($password, PASSWORD_ARGON2I);
//var_dump($db);
$q->bind_param("ss", $email, $passwordHash);
$result = $q->execute();
if($result){
    echo "Account created properly";
} else {
    echo "Coś poszło nie tak";
}
    }else {

        echo "Passwords are diffrent!";
    }
}




?>
<h1>Zaloguj się</h1>
<form action="index.php" method="post">
    <label for="emailInput">Email:</label>
    <input type="email" name="email" id="emailInput">
    <label for="passwordInput">Hasło:</label>
    <input type="password" name="password" id="passwordInput">
    <input type="hidden" name = "action" value= "login">
    <input type="submit" value="Log In">
</form>

<h1>Zarejestruj się</h1>
<form action="index.php" method="post">
    <label for="emailInput">Email:</label>
    <input type="email" name="email" id="emailInput">
    <label for="passwordInput">Hasło:</label>
    <input type="password" name="password" id="passwordInput">
    <label for="passwordRepeat">Powtórz hasło:</label>
    <input type="password" name="passwordRepeat" id="passwordRepeatInput">
    <input type="hidden" name = "action" value= "register">
    <input type="submit" value="Sign In">
</form>



