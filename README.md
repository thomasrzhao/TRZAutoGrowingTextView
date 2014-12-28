TZAutoGrowingTextView
=====================

A UITextView subclass that grows to fit its contents. Useful for creating a vertically centered text view.

Usage
---------------------
You can use it like a regular UITextView.

To achieve the vertically centered effect, simply add center horizontal and center vertical constraints to the text view.

To limit the growth of the text view so that it stays on-screen even if there is too much content, you can add >= constraints to the top and bottom edges of the text view. This will constrain the text view's size, while still allowing it to remain centered at smaller sizes.

Interface Builder
---------------------
This class works with Interface Builder. However, because Interface Builder does not respect custom UIView subclasses' intrinsic content size, you will have to specify a placeholder size to avoid warnings.

You can do this by changing the Intrinsic Content size setting in the Size Inspector from "Default (System Defined)" to "Placeholder".

* I've tried making the class IBDesignable, but Interface Builder just crashes.
