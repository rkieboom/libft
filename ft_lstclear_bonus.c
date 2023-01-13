/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_lstclear_bonus.c                                :+:    :+:            */
/*                                                     +:+                    */
/*   By: rkieboom <rkieboom@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2019/11/29 07:25:26 by rkieboom       #+#    #+#                */
/*   Updated: 2019/11/29 09:08:25 by rkieboom      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_lstclear(t_list **lst, void (*del)(void*))
{
	t_list *temp;
	t_list *list;

	list = *lst;
	while (list)
	{
		ft_lstdelone(list, del);
		temp = list->next;
		list = temp;
	}
	*lst = NULL;
}
