'''A Calculator Implemented With A Top-Down, Recursive-Descent Parser'''
# Author: Erez Shinan, Dec 2012

import re, collections
from operator import and_, or_, not_

Token = collections.namedtuple('Token', ['name', 'value'])
RuleMatch = collections.namedtuple('RuleMatch', ['name', 'matched'])

token_map = {'&':'AND', '|':'OR', '~': 'NEG', '(':'LPAR', ')':'RPAR'}
rule_map = {
        'or' : ['and OR or', 'and'],
        'and' : ['atom AND and', 'atom'],
        'atom': ['LOGIC', 'LPAR or RPAR', 'neg'],
        'neg' : ['NEG atom'],
}
fix_assoc_rules = 'or', 'and'

bin_calc_map = {'&':and_, '|':or_}
def calc_binary(x):
        while len(x) > 1:
            x[:3] = [ bin_calc_map[x[1]](x[0], x[2]) ]
        return x[0]

def to_bool(x):
    if x.lower() == 'true': return True
    if x.lower() == 'false': return False

calc_map = {
        'LOGIC' : lambda x: to_bool(x),
        'atom': lambda x:x[len(x)!=1],
        'neg' : lambda (d,x): not_(x),
        'and' : calc_binary,
        'or' : calc_binary,
}

def match(rule_name, tokens):
        if tokens and rule_name == tokens[0].name:      # Match a token?
            return tokens[0], tokens[1:]
        for expansion in rule_map.get(rule_name, ()):   # Match a rule?
            remaining_tokens = tokens
            matched_subrules = []
            for subrule in expansion.split():
                matched, remaining_tokens = match(subrule, remaining_tokens)
                if not matched:
                    break   # no such luck. next expansion!
                matched_subrules.append(matched)
            else:
                return RuleMatch(rule_name, matched_subrules), remaining_tokens
        return None, None   # match not found

def _recurse_tree(tree, func):
        return map(func, tree.matched) if tree.name in rule_map else tree[1]

def flatten_right_associativity(tree):
        new = _recurse_tree(tree, flatten_right_associativity)
        if tree.name in fix_assoc_rules and len(new)==3 and new[2].name==tree.name:
            new[-1:] = new[-1].matched
        return RuleMatch(tree.name, new)

def evaluate(tree):
        solutions = _recurse_tree(tree, evaluate)
        return calc_map.get(tree.name, lambda x:x)(solutions)

def calc(expr):
        if expr is None or expr == '':
          return
        split_expr = re.findall('true|false|[%s]' % ''.join(token_map), expr, re.I)
        print split_expr
        tokens = [Token(token_map.get(x, 'LOGIC'), x) for x in split_expr]
#        print tokens
        tree = match('or', tokens)[0]
        print tree
        tree = flatten_right_associativity( tree )
        return evaluate(tree)

if __name__ == '__main__':
        while True:
            print( calc(raw_input('> ')) )
