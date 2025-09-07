String? validationMessage(String val, int max, int min, String type) {
  if (val.isEmpty) {
    return "The field cannot be empty";
  } else if (val.length < min) {
    return "It cannot be less than $min characters";
  } else if (val.length > max) {
    return "It cannot be more than $max characters";
  }

  switch (type) {
    case "email":
      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(val)) {
        return "Please enter a valid email";
      }
      break;

    case "phone":
      if (!RegExp(r'^[0-9]+$').hasMatch(val)) {
        return "Phone number must contain only digits";
      }
      if (val.length < 10) {
        return "Phone number must be at least 10 digits";
      }
      break;

    case "password":
      if (!RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*@)[A-Za-z\d@]{6,}$',
      ).hasMatch(val)) {
        return "Password must contain uppercase, lowercase, number and @";
      }

      break;

    case "name":
      if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(val)) {
        return "Name can only contain letters";
      }
      break;
  }

  return null;
}
