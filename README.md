TRZAutoGrowingTextView
=====================

A UITextView subclass that grows (i.e. sets its intrinsicContentSize) to fit its contents. Useful for creating a vertically centered text view when used with Auto Layout.

Usage
---------------------
You can use it like a regular UITextView.

To achieve the vertically centered effect, simply add center horizontal and center vertical constraints to the text view.

To limit the growth of the text view so that it stays on-screen even if there is too much content, you can add >= constraints to the top and bottom edges of the text view. This will constrain the text view's size, while still allowing it to remain centered at smaller sizes.

Interface Builder
---------------------
This class works with Interface Builder, and is now IBDesignable. Just drag in a UITextView and set the Custom Class to TRZAutoGrowingTextView.