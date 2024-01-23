from torch.autograd import Variable

# models
view_neti_model = ...
bbox_segmentation_model = ...

# Freeze the weights of the bbox and segmentation model:
# Do this to not train/affect the weights of YOLACT
for param in bbox_segmentation_model.parameters():
    param.requires_grad = False

# Set the model to evaluation mode:
# Do this to not change the running mean and std of YOLACT's batchnorm layers, 
# and make dropout layers make full use of all weights, unlike forced dropping 
# out during training.
bbox_segmentation_model.cuda()
bbox_segmentation_model.eval()

# Define the optimizer for ViewNETI model:
# Put ONLY the weights/params of ViewNETI into the optimizer so that it gets updated while learning/backprop
view_neti_optimizer = torch.optim.Adam(view_neti_model.mapper.parameters(), lr=learning_rate)

# ... Inside training loop ...

# Forward pass for ground truth image (bbox and segmentation model not updated)
# To NOT accumulate gradients for GT image's bbox & segmap prediction
with torch.no_grad():
    predicted_bbox_gt, predicted_segmentation_gt = bbox_segmentation_model(ground_truth_image)

# Forward pass for novel image (bbox and segmentation model can accumulate gradients)
# To accumulate gradients for ViewNETI's novel image's bbox & segmap prediction
novel_image = Variable(novel_image).cuda()
# TODO: .cuda() everything
# TODO: Variable() everything (inc. GT at final stage before loss calculation)
predicted_bbox_vt, predicted_segmentation_vt = bbox_segmentation_model(novel_image)
novel_loss = loss_function(predicted_bbox_gt, predicted_bbox_vt, predicted_segmentation_gt, predicted_segmentation_vt)

# Backward pass for novel image (gradients will be accumulated)
novel_loss.backward()

# Update weights of ViewNETI
view_neti_optimizer.step()

# ... Continue with the rest of training loop ...
