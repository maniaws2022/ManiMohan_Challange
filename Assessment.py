import re

def validate_credit_card(card_num):
    
    valid = r"^[456]\d{3}(-?\d{4}){3}$"
    
    # Check if the card number matches the validation
    if not re.match(valid, card_num):
        return "Invalid"
    
    card_num = card_num.replace("-", "")
    
    # Check if there are 4 or more consecutive repeated digits
    if re.search(r"(\d)\1{3,}", card_num):
        return "Invalid"
    
    return "Valid"

test_cases = [
"4123456789123456",
"5123-4567-8912-3456",
"61234-567-8912-3456",
"4123356789123456",
"5133-3367-8912-3456",
"5123 - 3567 - 8912 - 3456"
]


# Validate each test case
for card in test_cases:
    print(f"{validate_credit_card(card)}")