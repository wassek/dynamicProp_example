package org.jahia.modules.dynamicprop.init;

import org.jahia.services.uicomponents.bean.editmode.EditConfiguration;
import org.jahia.services.uicomponents.bean.toolbar.Item;

public class DynamicPropToolbarInitializer {

	
	private Item toolbarItem = null;
	private EditConfiguration editMode = null;
	private String positionBefore = null;
	public void init() {
		if (positionBefore == null) {
		    editMode.getContextMenu().addItem(toolbarItem);
		} else {
			int index = 0;
			for (Item item : editMode.getContextMenu().getItems()) {
				if (positionBefore.equals(item.getId())) {
					break;
				}
				index ++;
			}
			editMode.getContextMenu().addItem(index, toolbarItem);
		}
		
	}

	public void destroy() {
		editMode.getContextMenu().removeItem(toolbarItem.getId());
	}

	public Item getToolbarItem() {
		return toolbarItem;
	}

	public void setToolbarItem(Item toolbarItem) {
		this.toolbarItem = toolbarItem;
	}

	public EditConfiguration getEditMode() {
		return editMode;
	}

	public void setEditMode(EditConfiguration editMode) {
		this.editMode = editMode;
	}

	public String getPositionBefore() {
		return positionBefore;
	}

	public void setPositionBefore(String positionBefore) {
		this.positionBefore = positionBefore;
	}

}
