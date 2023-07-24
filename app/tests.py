import unittest 
from field_gpt import ask_panda


class TestAdvisor(unittest.TestCase):

    def test_ask_panda(self):

        result = ask_panda("What is total field result yesterday")

        self.assertEqual(1,1)

