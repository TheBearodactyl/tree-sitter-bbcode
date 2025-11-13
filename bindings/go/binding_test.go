package tree_sitter_bbcode_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_bbcode "github.com/tree-sitter/tree-sitter-bbcode/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_bbcode.Language())
	if language == nil {
		t.Errorf("Error loading BBcode grammar")
	}
}
