# ASDKPagerViewControllerLayoutIssueDemo

A reduced case to demonstrate a layout issue when using an ASPagerNode with view controller cells.

The view controller in the app wraps an ASPagerNode. The first cell is a normal ASCellNode and functions correctly.
All the other cells are GuideRecViewController-wrappers, and their subnodes all have size (0, 0) no matter what I do.
If you read the _layout of the GuideRecScrollNode, the frames will be correct, but they do not get applied to the subviews.

Attempted remedies:
- Ensure the constrainedSize values are all correct. They are.
- Remove the GuideRecScrollNode and make GuideRecNode the GuideRecViewController's node directly.
- Manually trigger measurement on the scroll node and also set the contentSize to the size of the measured layout.
- Set preferredFrameSize on the GuideRecNode and its subnodes.
- Use an ASStaticLayoutSpec on the GuideRecNode that lays out one subnode at size (100, 100).

- GuideViewController: ASViewController
  - ASPagerNode
    - ASCellNode
      - GuideRecViewController: ASViewController
        - GuideRecScrollNode: ASScrollNode
          - GuideRecNode: ASDisplayNode
