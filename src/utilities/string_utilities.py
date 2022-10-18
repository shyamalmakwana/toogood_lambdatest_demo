def convert_money(old_money):
    remove_dollar = [w.replace('$', '') for w in old_money]
    remove_comma = [j.replace(',', '') for j in remove_dollar]
    str_list = list(remove_comma)
    new_str = "".join(str_list)
    return round(float(new_str), 2)


def sum_money(a, b, *args):
    return float(a) + float(b) + float(*args)


def convert_money_mobile(old_value):
    remove_dollar = [w.replace('$', '') for w in old_value]
    remove_comma = [j.replace(',', '') for j in remove_dollar]
    remove_k = [k.replace('K', '') for k in remove_comma]
    str_list = list(remove_k)
    new_value = "".join(str_list)
    return float(new_value)*1000


def round_money(money):
    return round(money, 2)

